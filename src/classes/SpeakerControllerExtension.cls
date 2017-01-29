public with sharing class SpeakerControllerExtension {
	public Blob picture { get; set; }
	public String errorMessage { get; set; } 
     
    private final Speaker__c speaker;
    private ApexPages.StandardController standardController;
    
    public SpeakerControllerExtension(ApexPages.StandardController standardController) {
        this.speaker = (Speaker__c) standardController.getRecord();
        this.standardController = standardController;
    }

	public PageReference save() { 
		this.errorMessage = '';
		upsert speaker;

		try {
			(new CMA_AttachPictureToSpeakerStrategy(this.speaker)).execute(this.picture);
		}  
		catch (System.Exception ex) {
			this.errorMessage = ex.getMessage();
			return null;
		}

		return new ApexPages.StandardController(this.speaker).view();
	}
}