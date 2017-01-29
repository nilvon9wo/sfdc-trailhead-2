@isTest
public class TEST_FakeSpeakerFactory extends TEST_SObjectFactory {
	private static Map<String, Object> defaultByKeyMap = new Map<String, Object>{
	}; 
	
	public static List<Speaker__c> createList(Speaker__c template, Integer quantity, TEST_DummyInsertModeEnum insertMode){
		MockStrategyInterface strategy = new SpeakerInQuantityStrategy(template, quantity); 
		return (List<Speaker__c>) TEST_SObjectFactory.createList(strategy, insertMode); 
	}
	
	public static Speaker__c create(TEST_DummyInsertModeEnum insertMode){
		Speaker__c template = new Speaker__c(first_name__c = 'John', last_name__c = 'Smith');
		Integer quantity = 1;
		return createList(template, quantity, insertMode)[0];
	}

	class SpeakerInQuantityStrategy extends SObjectInQuantityStrategy {
		SpeakerInQuantityStrategy(SObject template, Integer quantity) {
			super(template, quantity, 'Speaker__c ', defaultByKeyMap);
		} 
	}

/*	
	public static List<Speaker__c> createList(
			Speaker__c template, Integer quantity, List<Account> accountList, TEST_DummyInsertModeEnum insertMode
		){
		MockStrategyInterface strategy = new nSpeakersPerAccountStrategy(template, quantity, accountList); 
		return (List<Speaker__c>) TEST_SObjectFactory.createList(strategy, insertMode);
	}	  
 
	class nSpeakersPerAccountStrategy extends nSObjectPerRelatedSObjectStrategy {
		nSpeakersPerAccountStrategy(SObject template, Integer quantity, List<Account> accountList) {
			super(template, quantity, 'Speaker__c ', 'accountId', accountList, defaultByKeyMap);
		}
	}
*/	
}