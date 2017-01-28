public class DB_CampaignSelector {
    
    public List<Campaign> findByTerm(String term) {
    	List<List<sObject>> findListList = [
    		FIND :term
    		RETURNING Campaign
    	];
    	return (List<Campaign>) findListList[0];
    } 
}