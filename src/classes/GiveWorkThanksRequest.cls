global class GiveWorkThanksRequest {
    @InvocableVariable(label='Giver Id' required=true)
    global Id giverId;

    @InvocableVariable(label='Receiver Id' required=true)
    global Id receiverId;

    @InvocableVariable(label='Thanks Message' required=true)
    global String thanksMessage;

    @InvocableVariable(label='Badge Name' required=true)
    global String badgeName;
}