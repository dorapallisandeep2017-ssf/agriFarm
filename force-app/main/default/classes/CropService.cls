public with sharing class CropService {

    // Get All Crops
    public static List<Crop__c> getAllCrops() {

        return [
            SELECT Id,
                   Name,
                   Quantity__c,
                   Category__c,
                   Description__c
            FROM Crop__c
        ];
    }

    // Get Single Crop
    public static Crop__c getCropById(Id cropId) {

        return [
            SELECT Id,
                   Name,
                   Quantity__c,
                   Category__c,
                   Description__c
            FROM Crop__c
            WHERE Id = :cropId
            LIMIT 1
        ];
    }

    // Search Crops
    public static List<Crop__c> searchCrops(String searchKey) {

        return [
            SELECT Id,
                   Name,
                   Quantity__c,
                   Category__c,
                   Description__c
            FROM Crop__c
            WHERE Name LIKE :('%' + searchKey + '%')
        ];
    }

    // Filter By Category
    public static List<Crop__c> getCropsByCategory(String category) {

        return [
            SELECT Id,
                   Name,
                   Quantity__c,
                   Category__c,
                   Description__c
            FROM Crop__c
            WHERE Category__c = :category
        ];
    }

    // Create Crop
    public static Crop__c createCrop(Crop__c cropRecord) {

        insert cropRecord;
        return cropRecord;
    }

    // Update Crop
    public static Crop__c updateCrop(Crop__c cropRecord) {

        update cropRecord;
        return cropRecord;
    }

    // Delete Crop
    public static void deleteCrop(Id cropId) {

        Crop__c cropRecord = [
            SELECT Id
            FROM Crop__c
            WHERE Id = :cropId
            LIMIT 1
        ];

        delete cropRecord;
    }
}