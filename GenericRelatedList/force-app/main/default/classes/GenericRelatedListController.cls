public class GenericRelatedListController
 {
    @AuraEnabled
    public static List<sObject> fetchRecords(String objectName , String fields , String relation , String recordId , String filter)
    {     
        
        try
            {
            //query for getting data 
            String query = 'Select Id ,'+fields+' '+'FROM '+objectName+' WHERE '+relation+' =\''+recordId+'\'';

            //if extra filter is available then it will add into query
            if(filter != null)
            {
                if(filter.length()!=0)
                    query = query+'AND '+filter;
            }
            system.debug(query);
            system.debug(Database.query( query ));
            return Database.query( query );  
    }
    catch(Exception e)
    {
        throw new  AuraHandledException(e.getMessage());
    }
    }
}
