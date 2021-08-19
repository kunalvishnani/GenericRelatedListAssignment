@isTest
public class GenericRelatedListControllerTest
{
    @IsTest
    static void test1()
    {
        Test.startTest();
        //Insert an account
        Account a =new Account();
        a.Name='kunal';
        INSERT a;
        //Insert a contact
        Contact b = new Contact();
        b.FirstName='kunal';
        b.LastName='vishnani';
        b.AccountId=a.Id;
        INSERT b;
        Test.stopTest();

        //Checking the return statment of query
        List<sObject> lst = GenericRelatedListController.fetchRecords('Contact','FirstName,LastName','AccountId',a.Id,'FirstName = \'kunal\'');
        System.assertEquals(true,lst!=null);
        List<sObject> lst1 = GenericRelatedListController.fetchRecords('Contact','FirstName,LastName','AccountId',a.Id,null);
        System.assertEquals(true, lst1!=null);
    }
}
