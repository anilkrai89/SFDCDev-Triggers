//Scenario 1: – Create a follow up Task on the Opportunity record when the
//Opportunity stage is set to ‘Closed Won’.
trigger OppTrigger on Opportunity (After Update) {
    
    if(Trigger.Isafter && trigger.IsInsert){
         System.debug('create task');
    OppTriggerHandler.afterInsert(trigger.new,trigger.oldmap);
    }

   //Scenario 2:- To Update Existing Task where task Status is ‘Not Started ’ and
//related Opportunity Status is Closed Won. Change Task Status to
//Completed. 
   if(Trigger.Isafter && trigger.Isupdate){
        System.debug('Update task ');
    OppTriggerHandler.AfterUpdate(trigger.new,trigger.oldmap);
    }
    //Scenario 3 : Update Account Rating to ‘Hot ‘on account when opportunity stage
//equals ‘closed one’
   if(Trigger.Isafter && trigger.Isupdate){
        System.debug('Update account ');
    OppTriggerHandler.afterUpdateOpportunity(trigger.new);
    } 

//Scenario 4 :Write a trigger that updates the "City" field in an Account when the
//same field is updated in an Opportunity.
    if(Trigger.Isafter && trigger.Isupdate){
        System.debug('Update Acc ');
    OppTriggerHandler.afterUpdateOnOpportunuty(trigger.new,trigger.oldmap);
    }
}