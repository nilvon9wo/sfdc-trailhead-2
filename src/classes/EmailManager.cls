public with sharing class EmailManager {
	TH_EmailSendingService emailSendingService;
	public EmailManager(TH_EmailSendingService emailSendingService) {
		this.emailSendingService = emailSendingService;
	}

	public EmailManager() {
		this(new TH_EmailSendingService());
	}
	
    public boolean send(String address, String subject, String body) {
    	return this.emailSendingService.sendMail(address, subject, body);
    }
    
    public static boolean sendMail(String address, String subject, String body) {
    	EmailManager manager = new EmailManager();
    	return manager.send(address, subject, body);
    }
}