            public class AccountTrgHandler { 
            //Create contact Record whenever Account is created/
                Public static void createAccVsContacts(Map<id,Account> acc){
                        list<contact> c =new list<contact>();
                        for(Account a :acc.values()){
                            c.add(new contact( lastname =a.name,accountid =a.id));    
                        }
                    if(c.size()>0){
                        insert c;
                    }
                }
             }
