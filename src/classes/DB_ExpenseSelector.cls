public class DB_ExpenseSelector extends fflib_SObjectSelector { 
    public List<Schema.SObjectField> getSObjectFieldList() {
    	return new List<Schema.SObjectField> {
    		Expense__c.amount__c,
    		Expense__c.client__c,
    		Expense__c.createdDate,
    		Expense__c.date__c,
    		Expense__c.id,
    		Expense__c.name,
    		Expense__c.reimbursed__c
    	};
    } 
    
    public Schema.SObjectType getSObjectType() {
    	return Expense__c.sObjectType;
    }    
    
    public List<Expense__c> selectAll() {
    	return (List<Expense__c>) Database.query(
        	newQueryFactory().toSOQL()
        );
    }
}