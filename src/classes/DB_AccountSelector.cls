public class DB_AccountSelector {
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