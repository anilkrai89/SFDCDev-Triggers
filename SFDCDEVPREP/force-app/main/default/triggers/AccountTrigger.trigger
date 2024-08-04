trigger AccountTrigger on Account (after Insert){
    if(trigger.isafter && trigger.Isinsert){
         
            AccountTrgHandler.createAccVsContacts(trigger.newmap);
        }
        