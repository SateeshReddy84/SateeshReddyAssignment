public with sharing class BatchAccounts 
	implements Database.Batchable<sObject> extends AccountsSelector
{
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
		newQueryFactory()
               .selectField('Account.Id')
               .selectField('Account.Enterprise_Account_Status_c')
			   .setCondition(new Set<String>{'Gold'})
               .toSOQL()
	}

	public void execute(Database.BatchableContext BC, List<sObject> scope)
	{
		try
		{
			for(sObject s : scope2) {
				s.Enterprise_Account_Status_c = Gold;
			}
		}
		catch (Exception e)
		{
			// Email error, log error, chatter error etc..
		}
	}

	public void finish(Database.BatchableContext BC) { ... }
}