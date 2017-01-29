public class DB_HotelSelector extends fflib_SObjectSelector { 
    public List<Schema.SObjectField> getSObjectFieldList() {
    	return new List<Schema.SObjectField> {
    		Hotel__c.id,
    		Hotel__c.name,
    		Hotel__c.location__latitude__s,
    		Hotel__c.location__longitude__s
    	};
    } 
    
    public Schema.SObjectType getSObjectType() {
    	return Hotel__c.sObjectType;
    }    
    
    public List<Hotel__c> selectAll() {
    	fflib_QueryFactory hotelQueryFactory = newQueryFactory();
    	
    	return (List<Hotel__c>) Database.query(
        	hotelQueryFactory.setCondition('id IN :idSet').toSOQL()
        );
    }
}