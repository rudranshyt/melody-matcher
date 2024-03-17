/**
 * @description       : send playlist email trigger handler
 * @author            : Rudransh Shukla
 * @group             : 
 * @last modified on  : 03-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class sendEmail {
    
    public static void sendEmailToCustomer(List<Customer_User__c> newRecords) {
        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();

        for(Customer_User__c record : newRecords) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new List<String>{record.Email__c}); 
                email.setSubject('Melody Matcher - Here is your special Playlist'); 
            if(record.Crieteria__c == '1') { 
                email.setPlainTextBody('Dear '+record.Username__c+',\n\n'+'Here is your special playlist - https://open.spotify.com/playlist/37i9dQZF1EIdhQkHfnuNWv?si=94f84e1bf1c84eaa \n\n'+'Hope you enjoy the music.\n\n'+'Warm Regards\n'+'Melody Matcher'); 
            }
            else if(record.Crieteria__c == '2') { 
                email.setPlainTextBody('Dear '+record.Username__c+',\n\n'+'Here is your special playlist - https://open.spotify.com/playlist/2YsVFAOIyHgaEaIqpoIUFl?si=b10b3d8923d445d5 \n\n'+'Hope you enjoy the music.\n\n'+'Warm Regards\n'+'Melody Matcher'); 
            }
            else if(record.Crieteria__c == '3') { 
                email.setPlainTextBody('Dear '+record.Username__c+',\n\n'+'Here is your special playlist - https://open.spotify.com/playlist/37i9dQZF1E8NSFs6Vi97QB?si=1e6224442a044382 \n\n'+'Hope you enjoy the music.\n\n'+'Warm Regards\n'+'Melody Matcher'); 
            }
            else if(record.Crieteria__c == '4') { 
                email.setPlainTextBody('Dear '+record.Username__c+',\n\n'+'Here is your special playlist - https://open.spotify.com/playlist/6x99H1Qmr878Qk4WpNGCN1?si=4bb647e7eee045ce&pt=475dbc3f002dd7b269390a27075ef2ae \n\n'+'Hope you enjoy the music.\n\n'+'Warm Regards\n'+'Melody Matcher'); 
            }

            emailsToSend.add(email);
        }

        if(!emailsToSend.isEmpty()) {
            Messaging.SendEmailResult[] sendResults = Messaging.sendEmail(emailsToSend);
            for(Messaging.SendEmailResult result : sendResults) {
                if(result.isSuccess()) {
                    System.debug('Email sent successfully');
                } else {
                    System.debug('Failed to send email----> ' + result.getErrors()[0].getMessage());
                }
            }
        }
    }
}