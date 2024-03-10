/**
 * @description       : trigger to send email as soon as the reocord is created
 * @author            : Rudransh Shukla
 * @group             : 
 * @last modified on  : 03-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger sendEmail on customer_user__c (after insert) {
    sendEmail.sendEmailToCustomer(trigger.new);
}