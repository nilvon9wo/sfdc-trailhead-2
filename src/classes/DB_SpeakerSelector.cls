public class DB_SpeakerSelector extends fflib_SObjectSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
                Speaker__c.first_name__c,
                Speaker__c.last_name__c,
                Speaker__c.email__c
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Speaker__c.sObjectType;
    }
    
}