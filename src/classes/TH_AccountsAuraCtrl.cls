public class TH_AccountsAuraCtrl {
	DB_AccountSelector accountSelector;
	
	public TH_AccountsAuraCtrl(DB_AccountSelector accountSelector) {
		this.accountSelector = accountSelector;
	}
	public TH_AccountsAuraCtrl() {
		this(new DB_AccountSelector());
	}
	
	@AuraEnabled
	public static List<Account> getAccounts() {
		return (new TH_AccountsAuraCtrl()).selectAll(); 
	}    

	private List<Account> selectAll() { 
		return this.accountSelector.selectAll();
	}    
}