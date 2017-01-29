public abstract class UTIL_IfPopulatedStringStrategy implements UTIL_IfPopulatedStringStrategyInterface { 
	public Boolean execute(String stringToCheck) {  
		if (String.isBlank(stringToCheck)) {
			return this.doIfEmpty();
		}
		else { 
			return this.doIfPopulated(stringToCheck);
		} 
	}    

	abstract Boolean doIfPopulated(String stringToCheck); 	
	abstract Boolean doIfEmpty();
}