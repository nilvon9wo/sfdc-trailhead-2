var nforce = require('nforce');

var org = connectToSfdcApp(nforce);
authenticate(org);

function connectToSfdcApp(nforce) {
	return nforce.createConnection({
		clientId: process.env.CLIENT_ID,
		clientSecret: process.env.CLIENT_SECRET,
		redirectUri: process.env.CALLBACK_URL,
		mode: 'single'
	});
}

function authenticate(org) {
	var login = {
			username: process.env.USERNAME,
			password: process.env.PASSWORD+process.env.SECURITY_TOKEN
		};
	
	org.authenticate(login, loginHandler);

	function loginHandler(error, response) {
		if (error) {
			console.error(error);
		}
		else {
			console.info('Successfully logged in!  Cached Token: ' + org.oauth.access_token);
			selectAccount(org.query);
		}

		function selectAccount(query) {
			query( { query: 'SELECT id, name FROM Account LIMIT 5'}, queryHandler );
		}

		function queryHandler(error, response) {
			if (!error && response.records) {
				for (var i = 0; i < response.records.length; i++) {
					console.info(response.records[i].get('name'));
				}
			}
		}
	}
}



