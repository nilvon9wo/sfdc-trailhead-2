public class DB_MultiItemSelector {
	public Map<Schema.SObjectType,List<SObject>> findRecycledMaterials() {
		String term = 'recycled materials';
    	List<List<sObject>> findListList = [
    		FIND :term
    		RETURNING Product2, ContentVersion, FeedItem
    	];

		return new Map<Schema.SObjectType,List<SObject>>{
    		Product2.sObjectType => findListList[0],
    		ContentVersion.sObjectType => findListList[1],
    		FeedItem.sObjectType => findListList[2]
		};
	}
	
    public Map<Schema.SObjectType,List<SObject>> findFirstPlaceInFirstNetwork() {
		String term = 'first place';
    	List<List<sObject>> findListList = [
    		FIND :term 
    		RETURNING User(id, name),
    			FeedItem(id, parentId WHERE createdDate = THIS_YEAR ORDER BY createdDate DESC)
    		WITH NETWORK = '00000000000001'
    	];
		return new Map<Schema.SObjectType,List<SObject>>{
    		User.sObjectType => findListList[0],
    		FeedItem.sObjectType => findListList[1]
		};
    } 
}