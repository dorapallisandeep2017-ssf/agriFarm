public with sharing class CropService {

    public static List<Crop__c> getAllCrops() {

        return [SELECT Id, Name, Price__c, Quantity__c, Category__c
                FROM Crop__c];

    }

}