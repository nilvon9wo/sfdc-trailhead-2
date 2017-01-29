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
        return (List<Session_Speaker__c>) this.selectByDetails(idSet);
    }
    
    public List<Session_Speaker__c> selectById(List<Id> idList) {
        return this.selectById(new Set<Id>(idList));
    }
    
    public List<Session_Speaker__c> selectByDetails(Set<Id> idSet) {
        fflib_QueryFactory sessionSpeakerQueryFactory = newQueryFactory();

/*        
        fflib_QueryFactory sessionQueryFactory = new DB_SessionSelector()
                .addQueryFactorySubselect(sessionSpeakerQueryFactory);
        fflib_QueryFactory speakerQueryFactory = new DB_SpeakerSelector()
                .addQueryFactorySubselect(sessionSpeakerQueryFactory);
*/
		new DB_SessionSelector().configureQueryFactoryFields(sessionSpeakerQueryFactory, 'Session__c');
		new DB_SpeakerSelector().configureQueryFactoryFields(sessionSpeakerQueryFactory, 'Speaker__c');
                

        return (List<Session_Speaker__c>) Database.query(
                sessionSpeakerQueryFactory.setCondition('id IN :idSet').toSOQL()
        );
    }  
    
    
}