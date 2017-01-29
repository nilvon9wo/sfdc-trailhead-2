public class UTIL_SObjectHelper {
    public List<Id> collectIds(List<SObject> sObjectList) {
    	List<Id> idList = new List<Id>();
    	for (sObject sOBj : sObjectList){
    		idList.add(sObj.id);
    	}
    	return idList;
    }
}