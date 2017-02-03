public class DB_CampingItemDAO {
    public List<Camping_Item__c> doUpsert(List<Camping_Item__c> campingItemList) {
    	upsert campingItemList;
    	return campingItemList;
    }    
}