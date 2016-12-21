({
    setLodashLoaded : function(cmp, event, helper){
        cmp.set("v.lodashLoaded",true);
        var rows = cmp.get("v.dataRows");
        
        if(!rows){
            rows = [];
            cmp.set("v.dataRows",rows);
        }
        
        if(cmp.get("v.init")){
            helper.initializeTable(cmp,event,helper,rows);
        }
    },
    initialize : function(cmp, event, helper){
        cmp.set("v.init",true);
        cmp.set("v.sortColumn",{'label':'','name':''});
        cmp.set("v.sortOrder",'');
        cmp.set("v.selectAll",false);
        var config = cmp.get("v.config");

        //set default value to the config object 
        if(config){
            if(config.searchBox !== false){
                config.searchBox = true;
            }
         
            //show search by columns only if search box is shown
            if(config.searchBox === true && config.searchByColumn && config.searchByColumn !== false){
                config.searchByColumn = true;
            }

            //Hacky need to create case with sf
            cmp.set("v.config",JSON.parse(JSON.stringify(config)));
        }

        //Bit hacky need to change it
        var checkAllCmp = cmp.find("selectAllCmp");
        if(checkAllCmp && !checkAllCmp.length){
            checkAllCmp = [checkAllCmp];
        }

        //uncheck select all checkboxes.Might need to move the DOM modification to renderer
        if(checkAllCmp){
        	for(var i = 0;i < checkAllCmp.length;i++){
                if(checkAllCmp[i].getElement()){
                    checkAllCmp[i].getElement().checked = false;
                }
            }    
        }	

        if(cmp.get("v.lodashLoaded")){
            helper.initializeTable(cmp,event,helper,cmp.get("v.dataRows"));
        }
        else{
            helper.showDtTable(cmp);
        }
    },
    searchRowByColumn : function(cmp,event,helper){
        cmp.set("v.reRender",false);
        cmp.set("v.searchByCol",event.getSource().get("v.value"));
        
        //Filter rows based on column change
        if(event.getSource().get("v.value")){
            helper.searchForText(cmp,event,helper);
        }
    },
    limitChange : function(cmp,event,helper){
        helper.updateLimit(cmp);
        helper.reRenderRows(cmp,event,helper,cmp.get("v._rows"),false);
    },
    searchForText : function(cmp,event,helper){
        window.clearTimeout(helper.timeoutRef);
        helper.timeoutRef = window.setTimeout(
            $A.getCallback(function() {
                if (cmp.isValid()) {
                    helper.searchForText(cmp,event,helper);
                }
            }),150
        );
    },
    sortColumn : function(cmp, event, helper) {
        helper.sortByColumn(cmp,event,helper);
    },
    previous : function(cmp, event, helper) {
        var offset = cmp.get("v.offset"),
            limit = cmp.get("v.limit"),
            searchTxt = cmp.get("v.searchTxt"),
            _rows = cmp.get("v._rows");
        
        offset -= limit;
        offset = (offset <= 0) ? 0 : offset;
        
        cmp.set("v.rowsToDisplay",_.slice(_rows,offset,offset+limit));
        cmp.set("v.offset",offset);
    },
    next : function(cmp, event, helper){
        var offset = cmp.get("v.offset"),
            limit = cmp.get("v.limit"),
            searchTxt = cmp.get("v.searchTxt"),
            _rows = cmp.get("v._rows");
        
        offset += limit;
        
        cmp.set("v.rowsToDisplay",_.slice(_rows,offset,offset+limit));
        cmp.set("v.offset",offset);
    },
    toggleRowsCheckbox : function(cmp,event,helper){
        var rows = cmp.get("v.dataRows");
        var selectAll = !cmp.get("v.selectAll");
        cmp.set("v.selectAll",selectAll);
        cmp.set("v.unSelectedRows",[]);

        if(selectAll){
            //new array instance to avoid alter the rows reference might be a bug in LC
            cmp.set("v.selectedRows",[].concat(rows)); 
        }
        else{
            cmp.set("v.selectedRows",[]);
        }
    },
    addRow : function(cmp,event,helper){
        var params = event.getParam('arguments');
        if(params && params.row){
            var rows = cmp.get("v.dataRows");
            rows.push(params.row);
            cmp.set("v.dataRows",rows);
            helper.reRenderRows(cmp,event,helper,rows,true);            
        }
    },
    updateRow : function(cmp,event,helper){
        var params = event.getParam('arguments');
        if(params && params.row){
            var rows = cmp.get("v.dataRows");            
            rows[params.index] = params.row;
            cmp.set("v.dataRows",rows);
            helper.reRenderRows(cmp,event,helper,rows,true);            
        }
    },  
    deleteRow : function(cmp,event,helper){
        var params = event.getParam('arguments');
        if(params && params.index != -1){
            var rows = cmp.get("v.dataRows"),
    			row = rows[params.index],
            	selectedRows = cmp.get("v.selectedRows"),
                unSelectedRows = cmp.get("v.unSelectedRows"),
                selectedRowIdx = selectedRows.indexOf(row),
                unSelectedRowIdx = unSelectedRows.indexOf(row);
            
            //delete row if present in selectedRow/unSelectedRows
            if(selectedRowIdx > -1){
                selectedRows.splice(selectedRowIdx,1);
                cmp.get("v.selectedRows",selectedRows);
            }
            else if(unSelectedRows > -1){ // may not happen edge case just being safe
                unSelectedRows.splice(unSelectedRowIdx,1);
                cmp.get("v.unSelectedRows",unSelectedRows);
            }
            
            rows.splice(params.index,1);
            cmp.set("v.dataRows",rows);
            helper.reRenderRows(cmp,event,helper,rows,true);            
        }
    },
    reInitialize : function(cmp,event,helper){
        cmp.set("v.selectedRows",[]);
        helper.reRenderRows(cmp,event,helper,cmp.get("v.dataRows"),true);
    },
    clearAllRows : function(cmp,event,helper){
        cmp.set("v.dataRows",[]);
        helper.reRenderRows(cmp,event,helper,[]);
    }
})