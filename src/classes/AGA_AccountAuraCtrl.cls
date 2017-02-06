public with sharing class AGA_AccountAuraCtrl  {
	private final Integer ACCOUNT_QUANTITY = 50;

	DB_AccountSelector accountSelector;
	public AGA_AccountAuraCtrl (DB_AccountSelector accountSelector){
		this.accountSelector = accountSelector;
	}
	public AGA_AccountAuraCtrl (){
		this(new DB_AccountSelector());
	}
	
	@AuraEnabled
	public static List<Account> findAll() {
		return (new AGA_AccountAuraCtrl ()).selectWithKnownLocations();
	}    

	public List<Account> selectWithKnownLocations() {
		return this.accountSelector.selectWithKnownLocations(ACCOUNT_QUANTITY);
	}    

}