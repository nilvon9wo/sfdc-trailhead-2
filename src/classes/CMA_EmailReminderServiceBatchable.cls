global class CMA_EmailReminderServiceBatchable implements Database.Batchable<sObject> {
	global CMA_EmailManager emailManager;
	 
	global String query;
	global String subject;
	global String body;
	
	global CMA_EmailReminderServiceBatchable(String query, String subject, String body, CMA_EmailManager emailManager) {
		this.query = query;
		this.subject = subject;
		this.body = body;
		this.emailManager = emailManager;
	}

	global CMA_EmailReminderServiceBatchable(String query, String subject, String body) {
		this(query, subject, body, new CMA_EmailManager());
	}
	
    global Database.QueryLocator start(Database.BatchableContext batchableContext) {
    	return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext batchableContext, List<Speaker__c> speakerList) {
    	for (Speaker__c speaker : speakerList) {
    		emailManager.send(speaker.email__c, this.subject, this.body);
    	}
    }
     
    global void finish (Database.BatchableContext batchableContext) {
    }
}