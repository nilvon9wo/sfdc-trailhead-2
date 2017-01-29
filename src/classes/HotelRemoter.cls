global with sharing class HotelRemoter {
        DB_HotelSelector hotelSelector; 

        public HotelRemoter(DB_HotelSelector hotelSelector) {
                this.hotelSelector = hotelSelector;
        }
        
        public HotelRemoter() { 
                this(new DB_HotelSelector());
        }

    @RemoteAction
    global static List<Hotel__c> findAll() {
        HotelRemoter remoter = new HotelRemoter();
        return remoter.selectAll(); 
    }
    
    public List<Hotel__c> selectAll() {
        return hotelSelector.selectAll();
    }
    
}