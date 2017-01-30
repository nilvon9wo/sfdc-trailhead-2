require 'restforce'

client = Restforce.new 
	:username 		=> ENV['USERNAME'],
	:password 		=> ENV['PASSWORD'],
	:security_token => ENV['SECURITY_TOKEN'],
	:client_id      => ENV['CLIENT_ID'],
	:client_secret  => ENV['CLIENT_SECRET']
	
accounts = client.query("SELECT id, name FROM Account LIMIT 5")

accounts.each do |account|
	p account.Name
end

	