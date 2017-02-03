public with sharing class CAMP_CampingListAuraCtrl {
	DB_CampingItemDAO campingItemDao; 
	DB_CampingItemSelector campingItemSelector;
	
	public CAMP_CampingListAuraCtrl (DB_CampingItemDAO campingItemDao, DB_CampingItemSelector campingItemSelector) {
		this.campingItemDao = campingItemDao;
		this.campingItemSelector = campingItemSelector;
	}

	public CAMP_CampingListAuraCtrl () {
		this(new DB_CampingItemDAO(), new DB_CampingItemSelector());
	}
	
	@AuraEnabled
	public static List<Camping_Item__c> getItems() {
		return new CAMP_CampingListAuraCtrl().selectAll();
	}
	 
	private List<Camping_Item__c> selectAll() {
		return campingItemSelector.selectAll();
	}
	
	@AuraEnabled
	public static Camping_Item__c saveItem(Camping_Item__c campingItem) {
		return new CAMP_CampingListAuraCtrl().save(campingItem);
	}	
	
	private Camping_Item__c save(Camping_Item__c campingItem) {
		return campingItemDao.doUpsert(new List<Camping_Item__c>{campingItem})[0]; 
	}	
	
    
}