public class DB_ContactSelector extends fflib_SObjectSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
    	return new List<Schema.SObjectField> {
    		Contact.name,
    		Contact.phone,
    		Contact.email,
    		Contact.description
    	};
    }
    
    public Schema.SObjectType getSObjectType() {
    	return Contact.sObjectType;
    }
    
    public List<Contact> selectByDepartment(String department) {
    	return (List<Contact>) Database.query(
    		newQueryFactory()
    		.setCondition('department = :department')
    		.toSOQL()
    	);
    }
    
    public List<Contact> findByKeyword(String keyword) {
    	List<List<sObject>> findListList = [
    		FIND :keyword IN ALL FIELDS
    		RETURNING Contact(firstName, lastName, phone, email, description)
    	];
    	return (List<Contact>) findListList[0];
    } 
}