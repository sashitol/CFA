public with sharing class LookupCController {

    public LookupCController() {

    }


    public LookupCController(ApexPages.StandardController controller) {

    }

    @AuraEnabled

public static String getCurrentValue (String value) {

    return 'hi from apex';

}


}