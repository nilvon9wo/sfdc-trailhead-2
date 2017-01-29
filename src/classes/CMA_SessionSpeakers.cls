public class CMA_SessionSpeakers {
	DB_SessionSpeakerSelector sessionSpeakerSelector;
	fflib_SObjectUnitOfWork unitOfWork;
	List<Session_Speaker__c> sessionSpeakerList;
	UTIL_SObjectHelper sObjectHelper;

	public CMA_SessionSpeakers(
			List<Session_Speaker__c> sessionSpeakerList, 
			fflib_SObjectUnitOfWork unitOfWork,
			DB_SessionSpeakerSelector sessionSpeakerSelector, 
			UTIL_SObjectHelper sObjectHelper
		) {
		this.sessionSpeakerList = sessionSpeakerList;
		this.unitOfWork = unitOfWork;
		this.sessionSpeakerSelector = sessionSpeakerSelector;
		this.sObjectHelper = sObjectHelper;
	}
	
	public CMA_SessionSpeakers(List<Session_Speaker__c> sessionSpeakerList, fflib_SObjectUnitOfWork unitOfWork) {
		this(sessionSpeakerList, unitOfWork, new DB_SessionSpeakerSelector(), new UTIL_SObjectHelper()); 
	}
	
    public Boolean sendConfirmationEmails() {
		List<Id> sessionSpeakerIdList = sObjectHelper.collectIds(this.sessionSpeakerList);
		List<Session_Speaker__c> sessionSpeakerList = sessionSpeakerSelector.selectById(sessionSpeakerIdList);
		
		CMA_SendConfirmationEmailStrategy sendConfirmaion = new CMA_SendConfirmationEmailStrategy();
		sendConfirmaion.execute(sessionSpeakerList);
    	return sendConfirmaion.getResult();
    } 
}