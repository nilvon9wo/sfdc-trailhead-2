global without sharing class GiveWorkThanksAction {
	DB_FeedItemDAO feedItemDao; 
	DB_WorkBadgeDAO workBadgeDao;
	DB_WorkBadgeDefinitionSelector workBadgeDefinitionSelector;
	DB_WorkThanksDAO workThanksDao; 
	DB_WorkThanksShareDAO workThankShareDao;
	
	public GiveWorkThanksAction(
			DB_FeedItemDAO feedItemDao,
			DB_WorkBadgeDAO workBadgeDao,
			DB_WorkBadgeDefinitionSelector workBadgeDefinitionSelector, 
			DB_WorkThanksDAO workThanksDao,
			DB_WorkThanksShareDAO workThankShareDao
		) {
			this.feedItemDao = feedItemDao;
			this.workBadgeDao = workBadgeDao;
			this.workBadgeDefinitionSelector = workBadgeDefinitionSelector;
			this.workThanksDao = workThanksDao;
			this.workThankShareDao = workThankShareDao;
		}

	public GiveWorkThanksAction() {
		this(
			new DB_FeedItemDAO(),
			new DB_WorkBadgeDAO(), 
			new DB_WorkBadgeDefinitionSelector(), 
			new DB_WorkThanksDAO(), 
			new DB_WorkThanksShareDAO()
		);
	}
	
    @InvocableMethod(label='Give a Thanks Badge')
    global static void giveWorkBadgeActionsBatch(List<GiveWorkThanksRequest> requestList) {
    	(new GiveWorkThanksAction()).giveWorkBadge(requestList);
    }

    private void giveWorkBadge(List<GiveWorkThanksRequest> requestList) {
    	Map<GiveWorkThanksRequest, WorkThanks> workThanksByRequestMap = createThanks(requestList);
    	Map<String, WorkBadgeDefinition> workBadgeByNameMap = buildWorkBadgeByNameMap (requestList);
    	createWorkBadgeList(workThanksByRequestMap, workBadgeByNameMap);
    	createWorkThanksShareList(workThanksByRequestMap);
    	createFeedItmList(workThanksByRequestMap);
    }

	private Map<GiveWorkThanksRequest, WorkThanks> createThanks(List<GiveWorkThanksRequest> requestList) {
		Map<GiveWorkThanksRequest, WorkThanks> workThanksByRequestMap = new Map<GiveWorkThanksRequest, WorkThanks>();
    	for (GiveWorkThanksRequest request : requestList) {
			WorkThanks newWorkThanks = new WorkThanks(
				giverId = request.giverId,
				message = request.thanksMessage,
				ownerId = request.giverId
			);
			workThanksByRequestMap.put(request, newWorkThanks);
    	}
		 this.workThanksDao.doInsert(workThanksByRequestMap.values());
		 return workThanksByRequestMap;
	}
	
	private Map<String, WorkBadgeDefinition> buildWorkBadgeByNameMap (List<GiveWorkThanksRequest> requestList) {
		Set<String> badgeNameSet = new Set<String>();
    	for (GiveWorkThanksRequest request : requestList) {
    		badgeNameSet.add(request.badgeName);
    	}
    	Map<String, WorkBadgeDefinition> workBadgeByNameMap = new Map<String, WorkBadgeDefinition>();
    	for(WorkBadgeDefinition workBadge : this.workBadgeDefinitionSelector.selectByName(badgeNameSet)){
    		workBadgeByNameMap.put(workBadge.name, workBadge);
    	} 
    	return workBadgeByNameMap;
	}
	
	private List<WorkBadge> createWorkBadgeList(
			    	Map<GiveWorkThanksRequest, WorkThanks> workThanksByRequestMap,
    				Map<String, WorkBadgeDefinition> workBadgeByNameMap
		){
			List<WorkBadge> newWorkBadgeList = new List<WorkBadge>();
			for (GiveWorkThanksRequest request: workThanksByRequestMap.keySet()) {
				newWorkBadgeList.add(new WorkBadge(
					definitionId = workBadgeByNameMap.get(request.badgeName).id,
					recipientId = request.receiverId,
					sourceId = workThanksByRequestMap.get(request).id
				)); 
			}
			this.workBadgeDao.doInsert(newWorkBadgeList);			
			return newWorkBadgeList;	 
		 }

	private List<WorkThanksShare> createWorkThanksShareList(
			    	Map<GiveWorkThanksRequest, WorkThanks> workThanksByRequestMap
		){
			List<WorkThanksShare> newWorkThankShareList = new List<WorkThanksShare>();
			for (GiveWorkThanksRequest request: workThanksByRequestMap.keySet()) {
				newWorkThankShareList.add(new WorkThanksShare(
					parentId = workThanksByRequestMap.get(request).id,
					userOrGroupId = request.receiverId,
					accessLevel = 'Edit'
				)); 
			}
			this.workThankShareDao.doInsert(newWorkThankShareList);			
			return newWorkThankShareList;	 
		 }

	private List<FeedItem> createFeedItmList(
			    	Map<GiveWorkThanksRequest, WorkThanks> workThanksByRequestMap
		){
			List<FeedItem> newFeedItemList = new List<FeedItem>();
			for (GiveWorkThanksRequest request: workThanksByRequestMap.keySet()) {
				newFeedItemList.add(new FeedItem(
					parentId = request.receiverId,
					createdById = request.giverId,
					body = request.thanksMessage,
					relatedRecordId = workThanksByRequestMap.get(request).id,
					type = 'RypplePost'
				)); 
			}
			this.feedItemDao.doInsert(newFeedItemList);			
			return newFeedItemList;	 
		 }


}