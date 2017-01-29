public with sharing class SpeakerVFCtrlExtension {
    public Integer counter {get; set;}
    
    private final Speaker__c speaker;
    private ApexPages.StandardController standardController;
    
    public SpeakerVFCtrlExtension(ApexPages.StandardController standardController) {
        this.speaker = (Speaker__c) standardController.getRecord();
        this.standardController = standardController;
        this.counter = 0;
    }
    
    public Integer increment() {
        return counter++; 
    }
}