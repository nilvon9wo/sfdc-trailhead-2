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
}