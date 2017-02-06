public with sharing class TH_ContactsAuraCtrl  {
	DB_ContactSelector contactSelector;
	
	public TH_ContactsAuraCtrl (DB_ContactSelector contactSelector){
		this.contactSelector = contactSelector;
	}
	public TH_ContactsAuraCtrl (){
		this(new DB_ContactSelector());
	}
	
	@AuraEnabled
	public static List<Contact> getContacts() {
		return (new TH_ContactsAuraCtrl ()).selectAll();
	}    

	public List<Contact> selectAll() {
		return this.contactSelector.selectAll();
	}    

}