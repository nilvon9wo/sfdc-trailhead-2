@isTest
public class TRIG_SessionSpeakerTriggerHandlerIntTest {
    private static final User TestRunner = TEST_RunAsUserFactory.create();

	static testMethod void testSingleBooking() {
		// Arrange
		Datetime now = System.now();
		Speaker__c speaker = TEST_FakeSpeakerFactory.create(TEST_DummyInsertModeEnum.REAL);
		Session__c session = TEST_FakeSessionFactory.create(TEST_DummyInsertModeEnum.REAL);
		Session_Speaker__c sessionSpeaker = new Session_Speaker__c (session__c = session.id, speaker__c = speaker.id);
		
		// Act
		Database.SaveResult result;
        System.runAs(TestRunner) {
            Test.startTest();
            {
                result = Database.insert(sessionSpeaker, false);
            }
            Test.stopTest();
        }
		
		// Assert
		System.assert(result.isSuccesS());
	}   
	
	static testMethod void testDoubleBooking() {
		// Arrange
		Datetime now = System.now();
		Speaker__c speaker = TEST_FakeSpeakerFactory.create(TEST_DummyInsertModeEnum.REAL);
		
		Session__c sessionTemplate = new Session__c(session_date__c = System.now()); 
		List<Session__c> sessionList = TEST_FakeSessionFactory.createList(sessionTemplate, 2, TEST_DummyInsertModeEnum.REAL);
		Session_Speaker__c sessionSpeaker1 = new Session_Speaker__c (session__c = sessionList[0].id, speaker__c = speaker.id);
		insert sessionSpeaker1;

		Session_Speaker__c sessionSpeaker2 = new Session_Speaker__c (session__c = sessionList[1].id, speaker__c = speaker.id);
		// Act
		Database.SaveResult result;
        System.runAs(TestRunner) {
            Test.startTest();
            {
                result = Database.insert(sessionSpeaker2, false);
            }
            Test.stopTest();
        }
		
		// Assert
		System.assert(!result.isSuccesS());
	} 
}