public class DB_ProductSelector {
    public List<Product2> findTermWithPricebook (String term) {
    	List<List<sObject>> findListList = [
    		FIND :term 
    		RETURNING Product2
    		WITH PricebookId = '01sxx0000002MffAAE'
    	];
    	return (List<Product2>) findListList[0];
    } 
    
    public List<Product2> findShoeWithPricebook() {
    	return this.findTermWithPricebook('shoe');
    }
}