public without sharing class ContractUIController {
/*    
    public class ActionStatus{
        public String ReturnData {get; set;}
        public Boolean IsSuccess {get; set;}
    }
    
    @AuraEnabled
    public static List<Contract> getContracts (String accountId){
        List<Contract> contracts = [SELECT Id, EndDate, StartDate, ContractTerm, Type_of_Agreement__c FROM Contract WHERE AccountId = :accountId];                               
        return contracts;
    }
    
    @AuraEnabled
    public static void deleteContract (String contractId){
        Contract contract = [SELECT Id FROM Contract WHERE Id = :contractId]; 
        delete contract;
    }
    
    @AuraEnabled
    public static String createProspect (String contractId){
        Contract contract = [SELECT Id, AccountId, EndDate, ContractNumber, KKnr__c, Type_of_Agreement__c, Solution_Area__c FROM Contract WHERE Id = :contractId]; 

        Opportunity opp = new Opportunity();
        opp.AccountId = contract.AccountId;
        opp.RecordTypeId = SEUtility.getRecordTypeId(SEUtility.OPP_RECTYPE_PROSPECT);
        opp.ContractId = contract.Id;
        opp.Agreement_Start__c = contract.EndDate;
        opp.Name = contract.ContractNumber;
        opp.Pricebook2ID = '01s24000004fSp7';
        opp.KKnr__c = contract.KKnr__c;
        opp.Main_Product_Area__c = contract.Solution_Area__c;
        opp.CloseDate = Date.valueOf(contract.EndDate).addDays(1);
        opp.Is_Contract_Prospect_Opportunity__c  = true;
        
        if(opp.CloseDate < Date.today().addMonths(3)){
            opp.StageName = OpportunityValidationHandler.OPP_STAGE_ACTIVE_PROSPECT;
        } else {
            opp.StageName = OpportunityValidationHandler.OPP_STAGE_RESTING_PROSPECT;
        }       
  /*      
        //Author- N.G
        /******Granting sharing permission via APEX section*****************************
        List<AccountShare > accShares = new List<AccountShare >();
        AccountShare  accRecord = new AccountShare();
        accRecord.accountid = contract.KKnr__c;
        accRecord.UserOrGroupId = opp.ownerID;
        accRecord.accountaccesslevel = 'Read';
        accShares.add(accRecord);
        Database.SaveResult[] accShareInsertResult = Database.insert(accShares,false);
        
        system.debug('*****UserInfo.getUserId()'+UserInfo.getUserId());
        system.debug('*****contract.KKnr__crId()'+contract.KKnr__c);
        AccountShare AccShare = new AccountShare(AccountId = contract.KKnr__c, 
        AccountAccessLevel = 'Read', OpportunityAccessLevel = 'Edit',UserOrGroupId = UserInfo.getUserId());
        Insert AccShare;
        system.debug('***AccShare***'+AccShare);
        /*********************************************************************************/ 
        
/*    
    ActionStatus actionStatus = new ActionStatus();
        try{
            insert opp;
            actionStatus.IsSuccess = true;
            actionStatus.ReturnData = opp.Id;
        }catch(exception ex){
            actionStatus.IsSuccess = false;
            actionStatus.ReturnData = ex.getMessage();
        }
        
        System.debug(actionStatus);
        return JSON.serialize(actionStatus); 
    }
    
    @AuraEnabled
    public static String createOpportunity (String contractId){
        Contract contract = [SELECT Id, AccountId, EndDate, ContractNumber, KKnr__c, Type_of_Agreement__c, Solution_Area__c FROM Contract WHERE Id = :contractId]; 
        
        Opportunity opp = new Opportunity();
        opp.AccountId = contract.AccountId;
        opp.RecordTypeId = SEUtility.getRecordTypeId(SEUtility.OPP_RECTYPE_CYGATE_STANDARD);
        opp.ContractId = contract.Id;
        opp.Agreement_Start__c = contract.EndDate;
        opp.Name = contract.ContractNumber;
        opp.Pricebook2ID = '01s24000004fSp7';
        opp.KKnr__c = contract.KKnr__c;
        opp.Main_Product_Area__c = contract.Solution_Area__c;
        opp.CloseDate = Date.valueOf(contract.EndDate).addDays(1);
        opp.StageName = OpportunityValidationHandler.OPP_STAGE_QUALIFY;
        opp.Is_Contract_Prospect_Opportunity__c = true;
        
        ActionStatus actionStatus = new ActionStatus();
        try{
            insert opp;
            actionStatus.IsSuccess = true;
            actionStatus.ReturnData = opp.Id;
        }catch(exception ex){
            actionStatus.IsSuccess = false;
            actionStatus.ReturnData = ex.getMessage();
        }
        
        System.debug(actionStatus);
        return JSON.serialize(actionStatus);
    }
*/
}