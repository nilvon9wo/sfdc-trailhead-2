public class DB_SessionSpeakerSelector extends fflib_SObjectSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
    	return new List<Schema.SObjectField> {
    		Session_Speaker__c.Session__c,
    		Session_Speaker__c.Speaker__c
    	};
    } 
    
    public Schema.SObjectType getSObjectType() {
    	return Session_Speaker__c.sObjectType;
    }
    
    public List<Session_Speaker__c> selectById(Set<Id> idSet) {
        return (List<Session_Speaker__c>) this.selectWithDetails(idSet);
    }
    
    public List<Session_Speaker__c> selectById(List<Id> idList) {
        return this.selectById(new Set<Id>(idList));
    }
    
    public List<Session_Speaker__c> selectBySpeakerId(List<Id> idList){
        return (List<Session_Speaker__c>) Database.query(
                this.prepSessionSpeakerQueryFactory().setCondition('speaker__c IN :idList').toSOQL()
        );
    }
    
    private List<Session_Speaker__c> selectWithDetails(Set<Id> idSet) {
        return (List<Session_Speaker__c>) Database.query(
                this.prepSessionSpeakerQueryFactory().setCondition('id IN :idSet').toSOQL()
        );
    }

    private fflib_QueryFactory prepSessionSpeakerQueryFactory() {
        fflib_QueryFactory sessionSpeakerQueryFactory = newQueryFactory();

		new DB_SessionSelector().configureQueryFactoryFields(sessionSpeakerQueryFactory, 'Session__c');
		new DB_SpeakerSelector().configureQueryFactoryFields(sessionSpeakerQueryFactory, 'Speaker__c');

		return sessionSpeakerQueryFactory;
    }
}