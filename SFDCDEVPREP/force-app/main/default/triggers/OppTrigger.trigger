//Scenario 1: – Create a follow up Task on the Opportunity record when the
//Opportunity stage is set to ‘Closed Won’.

//Scenario 1:- To Update Existing Task where task Status is ‘Not Stated ’ and
//related Opportunity Status is Closed Won. Change Task Status to
//Completed.
//Update Account Rating to ‘Hot ‘on account when opportunity stage
//equals ‘closed one’

trigger OppTrigger on Opportunity (After Update) {
    
    if(Trigger.Isafter && trigger.IsInsert){
         System.debug('create task');
    OppTriggerHandler.afterInsert(trigger.new,trigger.oldmap);
    }
   if(Trigger.Isafter && trigger.Isupdate){
        System.debug('Update task ');
    OppTriggerHandler.AfterUpdate(trigger.new,trigger.oldmap);
    }
    
   if(Trigger.Isafter && trigger.Isupdate){
        System.debug('Update account ');
    OppTriggerHandler.afterUpdateOpportunity(trigger.new);
    } 
}