public class AccountsController {
	DB_AccountSelector accountSelector;
	
	public AccountsController(DB_AccountSelector accountSelector) {
		this.accountSelector = accountSelector;
	}
	public AccountsController() {
		this(new DB_AccountSelector());
	}
	
	@AuraEnabled
	public static List<Account> getAccounts() {
		return (new AccountsController()).selectAll(); 
	}    

	private List<Account> selectAll() { 
		return this.accountSelector.selectAll();
	}    
}