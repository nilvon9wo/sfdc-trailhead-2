public class CMA_SendConfirmationEmailsStrategy extends UTIL_IfPopulatedListStrategy {
     public Boolean doIfPopulated(List<Object> speakerSessionList) {
		Boolean result = true;
     	for (Session_Speaker__c sessionSpeaker: (List<Session_Speaker__c>) speakerSessionList) {
     		Speaker__c speaker = sessionSpeaker.speaker__r;
     		
     		CMA_SendConfirmationEmailStrategy sendConfirmation 
     			= new CMA_SendConfirmationEmailStrategy(speaker, sessionSpeaker.session__r);
     			 
     		result &= sendConfirmation.execute(speaker.email__c);
     	}
     	return result;
     }
     
     public Boolean doIfEmpty() {
     	return true; 
     }
}