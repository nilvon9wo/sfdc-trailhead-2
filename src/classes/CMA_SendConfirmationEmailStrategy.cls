public class CMA_SendConfirmationEmailStrategy extends UTIL_IfPopulatedStringStrategy {
	EmailManager emailManager;
	Speaker__c speaker;  
	Session__c session;  
 
	public CMA_SendConfirmationEmailStrategy (Speaker__c speaker, Session__c session, EmailManager emailManager) {
		this.speaker = speaker;
		this.session = session;
		this.emailManager = emailManager;
	}

	public CMA_SendConfirmationEmailStrategy (Speaker__c speaker, Session__c session) {
		this(speaker, session, new EmailManager());
	}
	
     public Boolean doIfPopulated(String emailAddress) {
		Boolean result = true;
 		String subject = 'Speaker Confirmation';
 		String message = 'Dear ' + this.speaker.first_name__c + ',\n'  
 			+ 'Your session "' + this.session.name + '" '
 			+ 'on ' + this.session.session_date__c + 'is confirmed.\n\n'
 			+ 'Thanks for speaking at the conference!';
 		return emailManager.send(emailAddress, subject, message);
     }
     
     public Boolean doIfEmpty() { 
     	return true;
     }
}