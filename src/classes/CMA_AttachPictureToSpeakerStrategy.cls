public class CMA_AttachPictureToSpeakerStrategy extends UTIL_IfPopulatedStrategy {
	Speaker__c speaker;
	
	public CMA_AttachPictureToSpeakerStrategy(Speaker__c speaker) {
		this.speaker = speaker;
	} 

     public Boolean doIfPopulated(Object picture) {
		this.speaker.picture_path__c = '/servlet/servlet.FileDownload?file=' + createAttachment((Blob) picture);
		update this.speaker;
		return true;
     }

	private Id createAttachment(Blob picture) {
		Attachment attachment = new Attachment();
		attachment.body = picture;
		attachment.name = 'speaker_' + this.speaker.id + '.jpg';
		attachment.parentId = this.speaker.id;
		attachment.contentType = 'application/jpg';
		insert attachment;
		return attachment.id;
	}
     
     public Boolean doIfEmpty() { 
     	return true;
     }
    
}