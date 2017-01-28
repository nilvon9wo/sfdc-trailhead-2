public class DB_MerchandiseSelector {
    
    public List<Merchandise__c> findByTerm(String term) {
    	List<List<sObject>> findListList = [
    		FIND :term
    		RETURNING Merchandise__c
    	];
    	return (List<Merchandise__c>) findListList[0];
    } 
    
    public List<Merchandise__c> findPinkHiTops() {
    	return this.findByTerm('pink hi-top');
    }
}