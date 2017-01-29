public class DB_SessionSelector extends fflib_SObjectSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
                Session__c.name,
                Session__c.session_date__c
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Session__c.sObjectType;
    }
    
}