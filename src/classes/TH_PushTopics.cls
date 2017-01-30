public class TH_PushTopics {
	DB_PushTopicDAO pushTopicDAO;
	
	TH_PushTopics (DB_PushTopicDAO pushTopicDAO) {
		this.pushTopicDAO = pushTopicDAO;
	}
	
	TH_PushTopics () {
		this(new DB_PushTopicDAO());
	}
	
	public PushTopic create(String name, String query, Decimal apiVersion) {
		return pushTopicDAO.doInsert(new List<PushTopic>{new PushTopic(
			name = name,
			query = query,
			apiVersion = apiVersion
		)})[0];
	}    
	
	public PushTopic createAccountStream() {
		String query = 'SELECT id, name, phone FROM Account WHERE BillingCity=\'San Francisco\'';
		return this.create('AccountUpdates', query, 37.0);
	}
	
	public PushTopic updatePreferences (PushTopic pushTopic, TH_PushTopicPreferences preferences) {
		pushTopic.NotifyForOperationCreate = preferences.includeCreate;
		pushTopic.NotifyForOperationUpdate = preferences.includeUpdate;
		pushTopic.NotifyForOperationUndelete = preferences.includeUndelete;
		pushTopic.NotifyForOperationDelete = preferences.includeDelete;
		return pushTopicDAO.doUpdate(new List<PushTopic>{pushTopic})[0];
	}
}