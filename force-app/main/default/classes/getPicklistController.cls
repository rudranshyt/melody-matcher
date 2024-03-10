/**
 * @description       : To get picklist values
 * @author            : Rudransh Shukla
 * @group             : 
 * @last modified on  : 03-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class getPicklistController {
    public List<String> getPicklistValues(
    String objectApiName,
    String fieldName
  ) {
    List<String> picklistValues = new List<String>();

    try {
      Schema.DescribeFieldResult fieldDescribe = Schema.getGlobalDescribe()
        .get(objectApiName)
        .getDescribe()
        .fields.getMap()
        .get(fieldName)
        .getDescribe();
      for (Schema.PicklistEntry entry : fieldDescribe.getPicklistValues()) {
        picklistValues.add(entry.getLabel());
      }
      System.debug('picklistValues------->' + picklistValues);
    } catch (Exception e) {
      System.debug('Error---->' + e.getMessage()+'--------->'+e.getLineNumber());
    }

    return picklistValues;
  }

  @AuraEnabled(cacheable=true)
  public static List<String> getCriteriaValues() {
    System.debug('started');

    String fieldName = 'Crieteria__c';
    String objectApiName = 'customer_user__c';

    getPicklistController controller = new getPicklistController();

    List<String> picklistValues = controller.getPicklistValues(
      objectApiName,
      fieldName
    );

    System.debug('Picklist Values-----> ' + picklistValues);

    return picklistValues;
  }

}