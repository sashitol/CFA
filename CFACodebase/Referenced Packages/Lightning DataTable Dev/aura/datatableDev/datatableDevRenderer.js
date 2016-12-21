({
	// Your renderer method overrides go here
    rerender : function(cmp,helper){
		this.superRerender();    
        var tbodyNode = cmp.find("tbody").getElement();
        var tableActionNodes = cmp.find("dtTableActions").getElement();
        var config = cmp.get("v.config") || {};

        //Construct the button/links for table actions
        if(tableActionNodes.childNodes.length == 0 && config && config.globalAction){
            var tabActionFrag = document.createDocumentFragment();
            for(var i = 0;i < config.globalAction.length;i++){
                var tabAction = config.globalAction[i];
                var tabActionNode;

                //add action only if 'id' is present
                if(tabAction.id){
                    if(tabAction.type === "url"){
                        tabActionNode = document.createElement("a");
                        tabActionNode.href = "javascript:void(0)";
                    }
                    else{
                        tabActionNode = document.createElement("button");
                        tabActionNode.type = "button";
                    }
                
                    tabActionNode.textContent = tabAction.label;
                    tabActionNode.className = tabAction.class;
                    tabActionNode.id = tabAction.id;
                    
                    //Fire dtActionClick event
                    tabActionNode.addEventListener('click',function(evt){
                        var tabActEvt = cmp.getEvent("dtActionClick");
                        tabActEvt.setParams({
                            "actionId":evt.currentTarget.id
                        });
                        tabActEvt.fire();
                    });
                    
                    tabActionFrag.appendChild(tabActionNode);
                }                
            }
            
            tableActionNodes.appendChild(tabActionFrag);
        }

        if(cmp.get("v.reRender")){

            //Remove the tbody childrens
            while(tbodyNode.firstChild){
                tbodyNode.removeChild(tbodyNode.firstChild); 
            }
            
            var rowsToDisplay = cmp.get("v.rowsToDisplay");
            var _columns = cmp.get("v._columns");
            var actualRows = cmp.get("v.dataRows");
            
            var trFragments = document.createDocumentFragment();
            var selectedRows = cmp.get("v.selectedRows");
            var unSelectedRows = cmp.get("v.unSelectedRows");

            //show message if array is empty
            if(!rowsToDisplay.length){
                var emptyRowNode = document.createElement('tr'),
                	emptyRowDataNode = document.createElement('td'),
                    colspan = _columns.length;
                
                emptyRowDataNode.textContent = 'No records to display';
                
                if(config.massSelect){
                    colspan++
                }
                
                if(config && config.rowAction){
                    colspan++;
                }
                
                emptyRowDataNode.setAttribute('colspan',colspan);
                emptyRowDataNode.className = 'slds-text-align--center';
                emptyRowNode.appendChild(emptyRowDataNode);
                trFragments.appendChild(emptyRowNode);
            }
            else{
                var selectAll = cmp.get("v.selectAll");
                var compId = cmp.getGlobalId();
                //Add the tr to the tbody
                for(var i = 0;i < rowsToDisplay.length;i++){
                    trFragments.appendChild(helper.generateRow(cmp,actualRows,rowsToDisplay[i],_columns,config,compId,i,selectedRows,unSelectedRows,selectAll));
                }  
            }
            
            tbodyNode.appendChild(trFragments);            
        }        
    },

})