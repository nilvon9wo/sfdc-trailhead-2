public abstract class UTIL_IfPopulatedStrategy implements UTIL_IfPopulatedStrategyInterface { 
	public Boolean execute(Object objectToCheck) {  
		if (objectToCheck == null
			&& (!(objectToCheck instanceof String) || String.isBlank((String) objectToCheck))) {
			return this.doIfEmpty();
		}
		else { 
			return this.doIfPopulated(objectToCheck);
		} 
	}     

	abstract Boolean doIfPopulated(Object objectToCheck); 	
	abstract Boolean doIfEmpty();
}