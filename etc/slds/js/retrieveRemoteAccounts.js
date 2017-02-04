(function(){
	const ACCOUNT_QUERY_CRITERIA = { orderby:[{ LastModifiedDate: 'DESC'}], limit: 10};

	var account = new SObjectModel.Account();
	var outputDiv = document.getElementById('account-list');
	updateOutputDiv();

	function updateOutputDiv() {
		account.retrieve(ACCOUNT_QUERY_CRITERIA, responseHander);
	}	
	
	function responseHander(error, records) {
		if (error) {
			alert (error.message);
			return false;
		}
		
		var dataTable = createDataTable();
		addHeaderRow(dataTable);
		buildTableBody(dataTable);
		
		if (outputDiv.firstChild) {
			outputDiv.replaceChild(dataTable, outputDiv.firstChild);
		}
		else {
			outputDiv.appendChild(dataTable);
		}
		
		return true;
		
		function createDataTable() {
			var dataTable = document.createElement('table')
			dataTable.className = 'slds-table slds-table--bordered slds-table--cell-buffer slds-no-row-hover';
			return dataTable;			
		}
		
		function addHeaderRow(dataTable) {
			var tableHeader = dataTable.createTHead();
			var tableHeaderRow = tableHeader.insertRow();
			insertCell(0, 'Account Name');
			insertCell(1, 'Account Id');
			
			function insertCell(index, label) {
				var tableHeaderRowCell = tableHeaderRow.insertCell(index);
				tableHeaderRowCell.appendChild(document.createTextNode(label));
				tableHeaderRowCell.setAttribute('scope', 'col');
				tableHeaderRowCell.setAttribute('class', 'slds-text-heading--label');
			}
		}

		function buildTableBody(dataTable) {
			var tableBody = dataTable.appendChild(document.createElement('tbody'));
			records.forEach(recordHandler);

			function recordHandler(record) {
				var dataRow = tableBody.insertRow();
				insertCell(0, 'Name');
				insertCell(1, 'Id');

				function insertCell(index, fieldName) {
					var dataRowCell = dataRow.insertCell(index);
					dataRowCell.appendChild(document.createTextNode(record.get(fieldName)));
				}
			}
		}
	}
})();