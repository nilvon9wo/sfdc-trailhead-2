@isTest
public class TestRejectDoubleBooking {
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
}