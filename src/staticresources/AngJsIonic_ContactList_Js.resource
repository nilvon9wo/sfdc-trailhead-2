angular.module('starter', ['ionic'])
    .config(function($stateProvider) {
        $stateProvider
            .state('contactlist', {
                url: '',
                templateUrl: '/apex/AngJsIonic_ContactListTemplate',
                controller : "ContactListCtrl"
            })

    })
    .controller('ContactListCtrl', function($scope) {
        var contactsRemote = new SObjectModel.Contact();
        contactsRemote.retrieve({ limit: 10 }, contactsResponseHandler);
        
        function contactsResponseHandler(error, contactRecords, event){
            if (error) {
                alert(error.message);
            } else {
                var contacts = [];
                contactRecords.forEach (function(contact){
                    contacts.push({
                    	id: contact.get("Id"), 
                    	name: contact.get("Name"), 
                    	title: contact.get("Title")
                    });
                });
                $scope.$apply(function() {
                    $scope.contacts = contacts;
                });
            }
        }
    })

