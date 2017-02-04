public class DB_CampingItemSelector extends fflib_SObjectSelector { 
    public List<Schema.SObjectField> getSObjectFieldList() {
    	return new List<Schema.SObjectField> {
    		Camping_Item__c.id,
    		Camping_Item__c.name,
    		Camping_Item__c.name__c,
    		Camping_Item__c.packed__c,
    		Camping_Item__c.price__c,
    		Camping_Item__c.quantity__c
    	};
    } 
    
    public Schema.SObjectType getSObjectType() {
    	return Camping_Item__c.sObjectType;
    }    
    
    public List<Camping_Item__c> selectAll() {
    	return (List<Camping_Item__c>) Database.query(
        	newQueryFactory().toSOQL()
        );
    }
}