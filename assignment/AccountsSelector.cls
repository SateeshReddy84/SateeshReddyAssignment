public class AccountsSelector extends SObjectSelector {
 
   public Schema.SObjectType getSObjectType(){
      return Account.sObjectType;
   }
 
   public override List<Schema.SObjectField> getSObjectFieldList(){
      return new List<Schema.SObjectField> {
         Account.Id,
         Account.Enterprise_Account_Status_c
      };
   }
 
   public List<Account> selectByName(Set<String> names){
      fflib_QueryFactory query = newQueryFactory();
      query.setCondition('Enterprise_Account_Status_c = : names');
      return (List<Account>) Database.query( query.toSOQL() );
   }
   
   public List<Account> selectById(Set<Id> recordIds){
      return (List<Account>) selectSObjectsById(recordIds);
   }
 
   public override String getOrderBy(){
      return 'Name DESC';
   }
   
   public List<Account> selectByName(Set<String> names){
      fflib_QueryFactory query = newQueryFactory();
      query.setLimit( 100 );
      return (List<Account>) Database.query( query.toSOQL() );
   }
   
   public List<Account> selectByName(Set<String> names){
   fflib_QueryFactory query = newQueryFactory();
   query.addOrdering('Name', fflib_QueryFactory.SortOrder. ASCENDING);
   return (List<Account>) Database.query( query.toSOQL() );
  }
 
}