public class DB_WorkBadgeDefinitionSelector extends fflib_SObjectSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
    	return new List<Schema.SObjectField> {
    		WorkBadgeDefinition.id,
    		WorkBadgeDefinition.name
    	};
    }
    
    public Schema.SObjectType getSObjectType() {
    	return WorkBadgeDefinition.sObjectType;
    }
    
    public List<WorkBadgeDefinition> selectByName(Set<String> badgeNameSet) {
    	return (List<WorkBadgeDefinition>) Database.query(
    		this.newQueryFactory()
    		.setCondition('name IN :badgeNameSet')
    		.toSOQL()
    	);
    }    
}