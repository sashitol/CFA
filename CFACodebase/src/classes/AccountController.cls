public class AccountController {
@AuraEnabled
    public static List<Account> getAccountsA()
    {
	        return [SELECT Id, Name, BillingStreet FROM Account];
    }
    
    @AuraEnabled
    public static List<Account> findAll() {
    return [SELECT id, name, Location__Latitude__s, Location__Longitude__s
            FROM Account
            WHERE Location__Latitude__s != NULL AND Location__Longitude__s != NULL
            LIMIT 50];
    }
        }