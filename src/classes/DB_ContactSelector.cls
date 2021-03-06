public class DB_ContactSelector extends fflib_SObjectSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
    	return new List<Schema.SObjectField> {
    		Contact.id,
    		Contact.description,
    		Contact.email,
    		Contact.name,
    		Contact.phone,
    		Contact.title
    	};
    }
    
    public Schema.SObjectType getSObjectType() {
    	return Contact.sObjectType;
    }
    
    public List<Contact> selectAll() {
    	return (List<Contact>) Database.query(
        	this.newQueryFactory().toSOQL()
        );
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
    
    public List<Contact> findEmail(String email) {
    	List<List<sObject>> findListList = [
    		FIND :email IN EMAIL FIELDS
    		RETURNING Contact
    	];
    	return (List<Contact>) findListList[0];
    } 
}