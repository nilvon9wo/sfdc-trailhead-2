public with sharing class CMA_EmailManager {
	TH_EmailSendingService emailSendingService;
	public CMA_EmailManager(TH_EmailSendingService emailSendingService) {
		this.emailSendingService = emailSendingService;
	}

	public CMA_EmailManager() {
		this(new TH_EmailSendingService());
	}
	
    public boolean send(String address, String subject, String body) {
    	return this.emailSendingService.sendMail(address, subject, body);
    }
    
    public static boolean sendMail(String address, String subject, String body) {
    	CMA_EmailManager manager = new CMA_EmailManager();
    	return manager.send(address, subject, body);
    }
}