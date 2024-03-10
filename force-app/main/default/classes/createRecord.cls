/**
 * @description       : add record to database
 * @author            : Rudransh Shukla
 * @group             : 
 * @last modified on  : 03-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public without sharing class createRecord {
    @AuraEnabled
    public static void addRecordMethod(string email, string name, string criteria){
        customer_user__c customer = new customer_user__c();
        customer.email__c = email;
        customer.Username__c = name;
        customer.Crieteria__c = criteria;

        try{
            insert customer;
        }
        catch(Exception e){
            system.debug('error---->'+e.getMessage()+'------->'+e.getLineNumber());
            throw e;
        }
    }

}