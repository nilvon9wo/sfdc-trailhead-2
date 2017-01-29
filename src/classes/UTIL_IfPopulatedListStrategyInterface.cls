public interface UTIL_IfPopulatedListStrategyInterface {
	Boolean doIfPopulated(List<Object> listToCheck);	
	Boolean doIfEmpty(); 
	Boolean execute(List<Object> listToCheck);    
}