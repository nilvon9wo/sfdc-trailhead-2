trigger SessionSpeakerTrigger on Session_Speaker__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
	fflib_SObjectDomain.triggerHandler(TRIG_SessionSpeakerTriggerHandler.class);    
}