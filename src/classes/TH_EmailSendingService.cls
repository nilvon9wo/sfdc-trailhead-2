public class TH_EmailSendingService {
    public Boolean sendMail(String address, String subject, String body) {
        Messaging.SingleEmailMessage mail = createEmailMessage(address, subject, body);
        return this.inspectResults(
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail})
        );
    }
    
    private Messaging.SingleEmailMessage createEmailMessage(String address, String subject, String body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[]{address});
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        return mail;
    }
    
    private Boolean inspectResults(Messaging.SendEmailResult[] resultArray){
        Boolean sendResult = true;
        for (Messaging.SendEmailResult result: resultArray) {
            if (result.isSuccess()) {
                System.debug(LoggingLevel.INFO, 'Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug(LoggingLevel.ERROR, 'The following errors occurred: ' + result.getErrors());
            }
        }
        return sendResult;
    }
}