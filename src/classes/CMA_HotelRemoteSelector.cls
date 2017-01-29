global with sharing class CMA_HotelRemoteSelector {
        DB_HotelSelector hotelSelector;  

        public CMA_HotelRemoteSelector(DB_HotelSelector hotelSelector) {
                this.hotelSelector = hotelSelector;
        }
        
        public CMA_HotelRemoteSelector() { 
                this(new DB_HotelSelector());
        }

    @RemoteAction
    global static List<Hotel__c> findAll() {
        CMA_HotelRemoteSelector remoter = new CMA_HotelRemoteSelector();
        return remoter.selectAll(); 
    }
    
    public List<Hotel__c> selectAll() {
        return hotelSelector.selectAll();
    }
    
}