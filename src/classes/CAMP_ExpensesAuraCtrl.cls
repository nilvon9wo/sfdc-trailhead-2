public with sharing class CAMP_ExpensesAuraCtrl {
	DB_ExpenseDAO expenseDao;
	DB_ExpenseSelector expenseSelector;
	
	public CAMP_ExpensesAuraCtrl(DB_ExpenseDAO expenseDao, DB_ExpenseSelector expenseSelector) {
		this.expenseDao = expenseDao;
		this.expenseSelector = expenseSelector;
	}

	public CAMP_ExpensesAuraCtrl() {
		this(new DB_ExpenseDAO(), new DB_ExpenseSelector());
	}
	
	@AuraEnabled
	public static List<Expense__c> getExpenses() {
		return new CAMP_ExpensesAuraCtrl().selectAll();
	}
	 
	private List<Expense__c> selectAll() {
		return expenseSelector.selectAll();
	}
	
	@AuraEnabled
	public static Expense__c saveExpense(Expense__c expense) {
		return new CAMP_ExpensesAuraCtrl().save(expense);
	}	
	
	private Expense__c save(Expense__c expense) {
		return expenseDao.doUpsert(new List<Expense__c>{expense})[0]; 
	}	
	
    
}