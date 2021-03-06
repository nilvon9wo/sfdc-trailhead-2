public class TRIG_SessionSpeakerTriggerHandler extends fflib_SObjectDomain {
	List<Session_Speaker__c> sessionSpeakerList;
	CMA_SessionSpeakers sessionSpeakers;
	
	public TRIG_SessionSpeakerTriggerHandler(List<Session_Speaker__c> sessionSpeakerList, CMA_SessionSpeakers sessionSpeakers) {
		super(sessionSpeakerList);
		this.sessionSpeakerList = sessionSpeakerList;
		this.sessionSpeakers = sessionSpeakers;
	}
 
	public TRIG_SessionSpeakerTriggerHandler(List<Session_Speaker__c> sessionSpeakerList) {
		this(sessionSpeakerList, new CMA_SessionSpeakers(sessionSpeakerList));
	}
	
	public class Constructor implements fflib_SObjectDomain.IConstructable {
		public fflib_SObjectDomain construct(List<SObject> sessionSpeakerList) {
			return new TRIG_SessionSpeakerTriggerHandler (sessionSpeakerList);
		}
	}
	
	// ------------------------------------------------------------------------------
	
    public override void onAfterInsert() {
    	sessionSpeakers.sendConfirmationEmails(); 
    }
    
    public override void onValidate() {
    	sessionSpeakers.rejectDoubleBooking(); 
    }
    
    public override void onValidate(Map<Id,SObject> existingAccountMap) {
    	sessionSpeakers.rejectDoubleBooking(); 
    }
    

}