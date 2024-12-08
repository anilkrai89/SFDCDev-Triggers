trigger AccountTrigger on Account (after Insert){
    //if(trigger.isafter && trigger.Isinsert){
         
           // AccountTrgHandler.createAccVsContacts(trigger.newmap);
     
       // }
        // calling Queueable Job from trigger
        System.enqueueJob(new QueueableDemo(trigger.new));
    }
        