@isTest
public class TEST_FakeSessionFactory extends TEST_SObjectFactory {
	private static Map<String, Object> defaultByKeyMap = new Map<String, Object>{
	}; 
	
	public static List<Session__c> createList(Session__c template, Integer quantity, TEST_DummyInsertModeEnum insertMode){
		MockStrategyInterface strategy = new SessionInQuantityStrategy(template, quantity); 
		return (List<Session__c>) TEST_SObjectFactory.createList(strategy, insertMode); 
	}
	
	public static Session__c create(TEST_DummyInsertModeEnum insertMode){
		Session__c template = new Session__c(name = 'Some Session', session_date__c = System.now());
		Integer quantity = 1;
		return createList(template, quantity, insertMode)[0];
	}

	class SessionInQuantityStrategy extends SObjectInQuantityStrategy {
		SessionInQuantityStrategy(SObject template, Integer quantity) {
			super(template, quantity, 'Session__c ', defaultByKeyMap);
		}
	}
}