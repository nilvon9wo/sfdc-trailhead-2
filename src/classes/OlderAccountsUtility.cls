public class OlderAccountsUtility {
	DB_AccountDAO accountDao;
	DB_AccountSelector accountSelector;
	
	public OlderAccountsUtility(DB_AccountDAO accountDao, DB_AccountSelector accountSelector) {
		this.accountDao = accountDao;
		this.accountSelector = accountSelector;
	}
	
	public OlderAccountsUtility() {
		this(new DB_AccountDAO(), new DB_AccountSelector());
	}
	
    public static void updateOlderAccounts() {
    	(new OlderAccountsUtility()).updateOld();
    }
    
    public List<Account> updateOld() {
    	List<Account> oldAccountList = this.accountSelector.selectOldest(5);
    	
    	for (Account account : oldAccountList) {
    		account.description = 'Heritage Account';
    	}
    	
    	return accountDao.doUpdate(oldAccountList);
    }
}