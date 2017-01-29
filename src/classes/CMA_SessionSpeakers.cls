public class CMA_SessionSpeakers {
	DB_SessionSpeakerSelector sessionSpeakerSelector; 
	DB_SessionSelector sessionSelector; 
	List<Session_Speaker__c> sessionSpeakerList;
	UTIL_SObjectHelper sObjectHelper;

	public CMA_SessionSpeakers(
			List<Session_Speaker__c> sessionSpeakerList, 
			DB_SessionSpeakerSelector sessionSpeakerSelector,
			DB_SessionSelector sessionSelector, 
			UTIL_SObjectHelper sObjectHelper
		) {
		this.sessionSpeakerList = sessionSpeakerList;
		this.sessionSpeakerSelector = sessionSpeakerSelector;
		this.sessionSelector = sessionSelector;
		this.sObjectHelper = sObjectHelper;
	}
	 
	public CMA_SessionSpeakers(List<Session_Speaker__c> sessionSpeakerList) {
		this(
			sessionSpeakerList,  
			new DB_SessionSpeakerSelector(), 
			new DB_SessionSelector(), 
			new UTIL_SObjectHelper() 
		); 
	}
	
    public Boolean sendConfirmationEmails() {
		List<Id> sessionSpeakerIdList = sObjectHelper.collectIds(this.sessionSpeakerList);
		List<Session_Speaker__c> sessionSpeakerList = sessionSpeakerSelector.selectById(sessionSpeakerIdList);
		return (new CMA_SendConfirmationEmailsStrategy()).execute(sessionSpeakerList);
    } 
    
    public Boolean rejectDoubleBooking() {
		List<Id> speakerIdList = sObjectHelper.collectIds(this.sessionSpeakerList, 'speaker__c');
		List<Session__c> relatedSessionList = sessionSelector.selectById(extractRequestedSessionIdSet());

    	return check(
    		fillRequestedBookingDateTimeBySessionIdMap(relatedSessionList),
    		sessionSpeakerSelector.selectBySpeakerId(speakerIdList)
		);
    }
    
    private Set<Id> extractRequestedSessionIdSet() {
    	Set<Id> idSet = new Set<Id>();
    	for (Session_Speaker__c sessionSpeaker : this.sessionSpeakerList) {
    		idSet.add(sessionSpeaker.session__c);
    	}
    	return idSet;
    }

    private Map<Id, DateTime> fillRequestedBookingDateTimeBySessionIdMap(List<Session__c> relatedSessionList){
    	Map<Id, DateTime> dateTimeBySessionIdMap = new Map<Id, DateTime>();
    	for (Session__c relatedSession: relatedSessionList) {
    		dateTimeBySessionIdMap.put(relatedSession.id, relatedSession.session_date__c);
    	}
    	return dateTimeBySessionIdMap;
    }
    
    private Boolean check(
	    	Map<Id, DateTime> requestedBookingDateTimeBySessionIdMap,
	    	List<Session_Speaker__c> relatedSessionSpeakerList 
    	) {
    	Boolean hasErrors = false;
    	for (Session_Speaker__c requestedSessionSpeaker : sessionSpeakerList) {
    		hasErrors &= invalidateDoubleBookings(
    			requestedBookingDateTimeBySessionIdMap, 
    			relatedSessionSpeakerList, 
    			requestedSessionSpeaker
    		);
    	}
    	return !hasErrors;
    }
    
    private Boolean invalidateDoubleBookings(
    		Map<Id, DateTime> requestedBookingDateTimeBySessionIdMap,
    	   	List<Session_Speaker__c> relatedSessionSpeakerList,
    	   	Session_Speaker__c requestedSessionSpeaker
   		) {
		Boolean isValid = true;   			
   		DateTime requestedBookingTime = requestedBookingDateTimeBySessionIdMap.get(requestedSessionSpeaker.session__c);
    	for (Session_Speaker__c relatedSessionSpeaker : relatedSessionSpeakerList) {
    		if (
    			relatedSessionSpeaker.id != requestedSessionSpeaker.id
    			&& relatedSessionSpeaker.speaker__c == requestedSessionSpeaker.speaker__c
    			&& relatedSessionSpeaker.session__r.session_date__c == requestedBookingTime 
    		) {
    			requestedSessionSpeaker.addError('The speaker is already booked at that time.');
    			isValid = false;
    		}
    	}
    	return isValid;
    }
}