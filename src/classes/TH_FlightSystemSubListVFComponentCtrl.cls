public class TH_FlightSystemSubListVFComponentCtrl {
    public String partName {get; set;}
    private String getPartName() {
        return this.partName;
    }


    public Integer partQuantity {get; set;}
    private Integer getPartQuantity() {
        return this.partQuantity;
    }
    
    public List<String> pieceList { 
        get{
            List<String> partList = new List<String>();
            for (Integer i = 1; i <= this.getPartQuantity(); i++) {
                partList.add(this.getPartName() + ' ' + i); 
            }
            return partList;
        }
    }
    
}