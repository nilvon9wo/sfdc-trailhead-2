public abstract class UTIL_IfPopulatedListStrategy implements UTIL_IfPopulatedListStrategyInterface { 
	public Boolean execute(List<Object> listToCheck) { 
		if (listToCheck == null || listToCheck.size() == 0) { 
			return this.doIfEmpty(); 
		}
		else {
			return this.doIfPopulated(listToCheck);
		}
	}    

	abstract Boolean doIfPopulated(List<Object> listToCheck); 	
	abstract Boolean doIfEmpty();
}