/**
 * @description       : add record to database
 * @author            : Rudransh Shukla
 * @group             : 
 * @last modified on  : 03-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class createRecord {
    @AuraEnabled
    public static void addRecordMethod(string email, string name, string criteria){
        customer_user__c customer = [select id, Username__c, Email__c, Crieteria__c from customer_user__c limit 1];
        customer.email__c = email;
        customer.Username__c = name;
        customer.Crieteria__c = criteria;

        try{
            insert customer;
        }
        catch(Exception e){
            system.debug('error---->'+e.getMessage()+'------->'+e.getLineNumber());
        }
    }

}