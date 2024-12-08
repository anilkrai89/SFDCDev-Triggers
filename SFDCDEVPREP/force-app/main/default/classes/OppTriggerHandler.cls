public class OppTriggerHandler {
    
    public static void afterInsert(list<Opportunity> newValue,Map<id,opportunity> oldValue){
        
        
        //Store the Parent id in the opid list 
        list<id> opid =new list<id>();
        for(opportunity op :newValue){
            if(op.stageName == 'Closed Won' && oldValue.get(op.id).stageName !='closed won'){
                
                opid.add(op.id);
            }
        }
        //Creating the Task from the stored parent id
        list<task> createTask =new list<Task>();
        for(id ids :opid){
            
             createTask.add(new task( WhatId =ids,subject ='Create task when opp is closed won',
                                    Status = 'Not Started',activitydate =date.today()+7,priority ='normal'));
            
        }
        if(createTask.size()>0){
            System.debug('create task DML');
            insert createTask;
        }
        
    }
    
   
    //We need to update the TASK status  from status "Not Started" whenever the opportunity status is set closed won.
    // step 1 store parent id in the list for all opportunity which status is going to closed won
    // step 2 from that parent id query all the task which has status not stated.
    // step 3 the update the task.
    public static void AfterUpdate(list<Opportunity> newValue,Map<id,opportunity> oldValue){
        
        list<Opportunity> Opid =new list<Opportunity>();
        
        for(Opportunity Op:newValue){
            if(op.StageName =='closed won' && oldValue.get(op.id).stagename <>'closed won'){
                Opid.add(op);
            }
        }
        List<Task> TK =[select status from task where whatid =:Opid and status ='Not Started'];
        list<task> taskToUpdate =new   list<task>();
        for(task t : TK){
            t.Status ='Completed';
                taskToUpdate.add(t);
            
        }
        
        if(taskToUpdate.size() >0){
            update taskToUpdate;
        }
        
    }
    
     //Update Account Rating to ‘Hot ‘on account when opportunity stage
    //equals ‘closed one’
    //When updates happens on child,it should also update the Parent.
    public static void afterUpdateOpportunity(list<Opportunity> OP){
        
        list<ID> acid = new list<ID>();
        for(Opportunity Opp :OP){
            if(Opp.StageName =='closed won')
                acid.add(Opp.Accountid);    
        }
       list<Account> toUpdateAccount = new list<Account>();
        for(Account acc :[select rating from Account where id in:acid ]){
            acc.rating ='HOT';
            toUpdateAccount.add(acc);
        }
        update toUpdateAccount;
        
    }

    //when updating opportunity,it should update account
    //Scenario 4 :Write a trigger that updates the "City" field in an Account when the
    //same field is updated in an Opportunity.
    
    public static void afterUpdateOnOpportunuty(list<opportunity> oplist,map<id,opportunity> oldValue){
        
       // list<ID> AccID =new list<id>();
        Map<id,string> mapOfAccCity = new Map<id,string>();
        for(Opportunity op :oplist){
            if(op.City__c!= oldValue.get(op.id).City__c){
                //AccID.add(op.Accountid);
                mapOfAccCity.put(op.Accountid,op.City__c);

            }
        }
        list<Account> accToUpdate =[select billingcity from Account where id in :mapOfAccCity.keyset()];
        for(Account a :accToUpdate ){
            a.billingcity =mapOfAccCity.get(a.id);
        }
        if(!accToUpdate.isEmpty()){
            update accToUpdate;
        }
    }

}