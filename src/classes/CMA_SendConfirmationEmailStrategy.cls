public class CMA_SendConfirmationEmailStrategy extends UTIL_IfPopulatedListStrategy {
	EmailManager emailManager;
	Boolean result = true;
	
	public CMA_SendConfirmationEmailStrategy (EmailManager emailManager) {
		this.emailManager = emailManager;
	}

	public CMA_SendConfirmationEmailStrategy () {
		this(new EmailManager());
	}
	
     public void doIfPopulated(List<Object> listToCheck) {
     	for (object obj: listToCheck) {
     		Session_Speaker__c sessionSpeaker = (Session_Speaker__c) obj;
     		Speaker__c speaker = sessionSpeaker.speaker__r;
     		Session__c session = sessionSpeaker.session__r;
     		String address = speaker.email__c;
     		if (!String.isBlank(address)) {
	     		String subject = 'Speaker Confirmation';
	     		String message = 'Dear ' + speaker.first_name__c  
	     			+ ',\nYour session "' + session.name
	     			+ '" on ' + session.session_date__c 
	     			+ 'is confirmed.\n\n'
	     			+ 'Thanks for speaking at the conference!';
	     		this.result &= emailManager.send(address, subject, message);
     		}
     	}
     }
     
     public void doIfEmpty() {
     }
     
     public Boolean getResult() {
     	return this.result;
     }
}