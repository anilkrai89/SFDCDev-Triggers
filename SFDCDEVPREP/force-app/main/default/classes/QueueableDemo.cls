//Create contact when accoun is created using Queueable Jobs

public with sharing class QueueableDemo implements Queueable {

    list<Account> Acc ;
    public QueueableDemo(list<Account> acclist) {
           this.Acc =acclist;
    }

    public void execute(QueueableContext qc){

        list<contact> c =new list<contact>();
        for(Account A :Acc){
            c.add(new contact(lastname =a.name,accountid=a.id));

        }
        if(c.size()>0){
            insert c;
        }


    }
}