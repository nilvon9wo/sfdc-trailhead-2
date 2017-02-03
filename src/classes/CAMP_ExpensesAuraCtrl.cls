public with sharing class CAMP_ExpensesAuraCtrl {
	DB_ExpenseSelector expenseSelector;
	
	public CAMP_ExpensesAuraCtrl(DB_ExpenseSelector expenseSelector) {
		this.expenseSelector = expenseSelector;
	}

	public CAMP_ExpensesAuraCtrl() {
		this(new DB_ExpenseSelector());
	}
	
	@AuraEnabled
	public static List<Expense__c> getExpenses() {
		return new CAMP_ExpensesAuraCtrl().getExpenses(new DB_ExpenseSelector());
	}
	
	private List<Expense__c> getExpenses(DB_ExpenseSelector expenseSelector) {
		return expenseSelector.selectAll();
	}
    
}