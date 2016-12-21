@isTest
public class OppertunityTest {
   static testMethod void validateHelloWorld() {
       Opportunity  a = new Opportunity();
       a.Name='name1';
       a.CloseDate=System.today();
       a.StageName='Prospecting';
       // Insert book
       insert a;
     OpportunityController.getOpportunities();
      OpportunityController.getOpportunity(a.Id);
       System.assertEquals('name1', a.Name);
    }
}