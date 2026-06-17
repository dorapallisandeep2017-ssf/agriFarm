@isTest
private class CropServiceTest {

    @testSetup
    static void createTestData() {

        Crop__c crop = new Crop__c(
            Name = 'Tomato',
            Quantity__c = 100,
            Category__c = 'Vegetables'
        );

        insert crop;
    }

    @isTest
    static void testGetAllCrops() {

        List<Crop__c> crops = CropService.getAllCrops();

        System.assert(crops.size() > 0);
    }

    @isTest
    static void testGetCropById() {

        Crop__c crop = [
            SELECT Id
            FROM Crop__c
            LIMIT 1
        ];

        Crop__c result = CropService.getCropById(crop.Id);

        System.assertEquals(crop.Id, result.Id);
    }

    @isTest
    static void testSearchCrops() {

        List<Crop__c> crops =
            CropService.searchCrops('Tom');

        System.assert(crops.size() > 0);
    }

    @isTest
    static void testGetCropsByCategory() {

        List<Crop__c> crops =
            CropService.getCropsByCategory('Vegetables');

        System.assert(crops.size() > 0);
    }

    @isTest
    static void testCreateCrop() {

        Crop__c crop = new Crop__c(
            Name = 'Potato',
            Quantity__c = 200,
            Category__c = 'Vegetables'
        );

        Crop__c result =
            CropService.createCrop(crop);

        System.assertNotEquals(null, result.Id);
    }

    @isTest
    static void testUpdateCrop() {

        Crop__c crop = [
            SELECT Id,
                   Quantity__c
            FROM Crop__c
            LIMIT 1
        ];

        crop.Quantity__c = 500;

        CropService.updateCrop(crop);

        Crop__c updatedCrop = [
            SELECT Quantity__c
            FROM Crop__c
            WHERE Id = :crop.Id
        ];

        System.assertEquals(
            500,
            updatedCrop.Quantity__c
        );
    }

    @isTest
    static void testDeleteCrop() {

        Crop__c crop = new Crop__c(
            Name = 'Delete Crop',
            Quantity__c = 50,
            Category__c = 'Vegetables'
        );

        insert crop;

        CropService.deleteCrop(crop.Id);

        Integer countRecords = [
            SELECT COUNT()
            FROM Crop__c
            WHERE Id = :crop.Id
        ];

        System.assertEquals(0, countRecords);
    }
}