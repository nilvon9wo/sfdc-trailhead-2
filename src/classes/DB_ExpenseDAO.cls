public class DB_ExpenseDAO {
    public List<Expense__c> doUpsert(List<Expense__c> expenseList) {
    	upsert expenseList;
    	return expenseList;
    }    
}