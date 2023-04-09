public with sharing class AccountManager {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        try {
          List<Account> accList = [Select Id, Name,Phone from Account Limit 10];
          System.debug('accList is '+accList);
          return accList;  
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountData(Integer num){
        return [Select Id, Name, Phone from Account Limit :num];
    }
}