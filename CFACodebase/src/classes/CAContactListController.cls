public class CAContactListController {  
/*    
    public class ContactStatus{
        @AuraEnabled
        public Contact Contact {get; set;}
        
        @AuraEnabled
        public Boolean IsCampaignMember {get; set;}
    }
    
    
    @AuraEnabled
    public static Call_Activity__c getCallActivity (String callActivityId){
        Call_Activity__c ca = [SELECT Id, Account__c, Account__r.Name, Campaign__c, Campaign__r.Name FROM Call_Activity__c WHERE Id = :callActivityId];                               
        return ca;
    }
    
    @AuraEnabled
    public static List<ContactStatus> getAccountContacts (String callActivityId){          
        Call_Activity__c callActivity = [SELECT Campaign__c, Account__c FROM Call_Activity__c WHERE Id =: CallActivityId];
        
        Map<Id, Contact> contacts = new Map<Id, Contact>([SELECT Id, Name, Email, Phone FROM Contact WHERE AccountId = :callActivity.Account__c]);   
        Map<Id, Contact> campaignMembers = new Map<Id, Contact>([SELECT Id FROM Contact WHERE Id IN (SELECT ContactId FROM CampaignMember WHERE ContactId IN :contacts.keyset() AND CampaignId = :callActivity.Campaign__c)]);
        
        List<ContactStatus> contactStatusList = new List<ContactStatus>();
        System.debug(campaignMembers);
        for (Contact c : contacts.values()) {
            ContactStatus cs = new ContactStatus();
            
            if(campaignMembers.get(c.Id) != null){
                cs.IsCampaignMember = true;
                cs.Contact = contacts.get(c.Id);
            }else{
                cs.IsCampaignMember = false;
                cs.Contact = contacts.get(c.Id);
            }
            contactStatusList.add(cs);
        }
        
        return contactStatusList;
    }
    
    @AuraEnabled
    public static void addToCampagin (String contactId, String campaignId){    
        try {
            CampaignMember cm = New CampaignMember(CampaignId = campaignId.substring(0, 15), ContactId = contactId.substring(0, 15), Status='Sent'); 
            Insert cm;
        } catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
    }
    
    @AuraEnabled
    public static void removeFromCampagin (String contactId, String campaignId){     
        try {
            CampaignMember cm = [SELECT Id FROM CampaignMember WHERE ContactId = :contactId AND CampaignId =:campaignId];
            delete cm;
        } catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
    }   
*/
}