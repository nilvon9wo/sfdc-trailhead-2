public class UTIL_SObjectHelper {
    public List<Id> collectIds(List<SObject> sObjectList, String idField) {
    	List<Id> idList = new List<Id>();
    	for (sObject sOBj : sObjectList){
    		idList.add((Id)sObj.get(idField));
    	}
    	return idList;
    }

    public List<Id> collectIds(List<SObject> sObjectList) {
    	return this.collectIds(sObjectList, 'id');
    }
}