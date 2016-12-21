public class opportunityButton {
    //Define the Project Object
    Opportunity theOpportunity = new Opportunity();   
    String theOpportunityID; 
    String theAccountID;
    String theURL;
    
    // Constructor - this only really matters if the autoRun function doesn't work right     
    public opportunityButton(ApexPages.StandardController stdController) {        
        this.theOpportunity = (Opportunity)stdController.getRecord();     
    } 
    
    // Code invoked on page load.      
    public PageReference autoRun()
    {           
        String thePageOpportunityId = ApexPages.currentPage().getParameters().get('id'); 
        if (thePageOpportunityId == null) 
        {             
            // Display the Visualforce page's error message if no Id is passed over             
            return null;         
        }       
      
    for (Opportunity theOpportunity:[select Id, Accountid from Opportunity where id =:thePageOpportunityId Limit 1]) 
    { 
        theOpportunityID = theOpportunity.Id; 
        theAccountID = theOpportunity.Accountid; 
        TheURL = 'https://somewebsite.com/SFDC/SFDC_Portal.aspx?OPRNBR=' + theOpportunityID  + '&OPRTYP=1&OPRACCT='+ theAccountID; 
    }  
      
   
    // Redirect the user to where ever you want to go.
    PageReference pageRef = new PageReference(TheURL);         
    pageRef.setRedirect(true);    
    return pageRef;    
    }
}