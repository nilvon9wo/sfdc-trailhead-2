public class TH_StreamingChannels {
	DB_StreamingChannelDAO streamingChannelDAO;
	
	TH_StreamingChannels(DB_StreamingChannelDAO streamingChannelDAO) {
		this.streamingChannelDAO = streamingChannelDAO;
	}

	TH_StreamingChannels() {
		this(new DB_StreamingChannelDAO());
	}

	public StreamingChannel create(String channelName) {
		return streamingChannelDAO.doInsert(new List<StreamingChannel>{new StreamingChannel(
			name = '/u/' + channelName	 
		)})[0];
	}
	
	public StreamingChannel createBroadcastChannel() {
		return this.create('Broadcast');
	}    
}