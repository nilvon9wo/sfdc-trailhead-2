public class DB_AccountSelector extends fflib_SObjectSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
    	return new List<Schema.SObjectField> {
    		Account.id,
    		Account.description,
    		Account.industry,
    		Account.location__latitude__s,
    		Account.location__longitude__s,
    		Account.name,
    		Account.numberOfEmployees,
    		Account.phone,
    		Account.tickerSymbol,
    		Account.type
    	};
    }
    
    public Schema.SObjectType getSObjectType() {
    	return Account.sObjectType;
    }
    
    public override String getOrderBy() {
        return 'createdDate ASC';
    }
    
    public List<Account> selectAll() {
    	return (List<Account>) Database.query(
        	this.newQueryFactory().toSOQL()
        );
    }
    
    public List<Account> selectOldest(Integer recordLimit) {
    	return (List<Account>) Database.query(
    		this.newQueryFactory()
    		.setLimit(recordLimit)
    		.toSOQL()
    	);
    }
	
    public List<Account> selectWithKnownLocations(Integer recordLimit) {
    	return (List<Account>) Database.query(
    		this.newQueryFactory()
    		.setCondition('location__latitude__s != NULL AND location__longitude__s != NULL')
    		.setLimit(recordLimit)
    		.toSOQL()
    	);
    }
        
    public List<Account> findTermInDivision (String term, String divisionField) {
    	List<List<sObject>> findListList = [
    		FIND :term 
    		RETURNING Account(name, industry)
    		WITH DIVISION = :divisionField
    	]; 
    	return (List<Account>) findListList[0];
    } 
    
    public List<Account> findCloudKicksInGlobalDivision() {
    	return this.findTermInDivision('Cloud Kicks', 'Global');
    }
}