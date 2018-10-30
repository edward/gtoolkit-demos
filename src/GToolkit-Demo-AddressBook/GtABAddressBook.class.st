"
I model an address book that can hold a list of contacts.
"
Class {
	#name : #GtABAddressBook,
	#superclass : #Object,
	#instVars : [
		'label',
		'contacts'
	],
	#classInstVars : [
		'default'
	],
	#category : #'GToolkit-Demo-AddressBook-Models'
}

{ #category : #browsing }
GtABAddressBook class >> contactsAddressesSearch [

	GTSpotterMorph new
		extent: 400@500;
		spotterModel: (GTSpotter 
			on: GtABAddressBook default
			withProcessors: {
				GtABAddressBook>>#spotterForAddressesFor:.
				GtABAddress>>#spotterForPeopleFor: });
		openCenteredInWorld
]

{ #category : #browsing }
GtABAddressBook class >> contactsBrowser [

	GTInspector new
  		filterByMethods: {GtABAddressBook>>#gtContactsOn: . GtABContact>>#gtContactOn:};
  		openOn: GtABAddressBook default
]

{ #category : #browsing }
GtABAddressBook class >> contactsSearch [

	GTSpotterMorph new
		extent: 400@500;
		spotterModel: (GTSpotter on: GtABAddressBook default);
		openCenteredInWorld
]

{ #category : #accessing }
GtABAddressBook class >> default [
	^ default ifNil: [ 
		default := self new
			label: 'Default'.
		self loadData ]
]

{ #category : #examples }
GtABAddressBook class >> exampleCustomInspector [

	GTInspector new
  		filterByMethods: {GtABAddressBook>>#gtContactsOn: . GtABContact>>#gtContactOn:};
  		openOn: GtABAddressBook default
]

{ #category : #examples }
GtABAddressBook class >> exampleCustomSpotter [

	GTSpotterMorph new
		extent: 400@500;
		spotterModel: (GTSpotter
			withProcessors: {
				GTSpotter>>#spotterAddressBookFor:.
				GtABAddressBook>>#spotterForAddressesFor:.
				GtABAddressBook>>#spotterForPeopleFor:.
				GtABAddressBook>>#spotterForTelephonesFor:.
				GtABAddress>>#spotterForPeopleFor:.
				GtABTelephone>>#spotterForContactsFor: });
		openCenteredInWorld
]

{ #category : #examples }
GtABAddressBook class >> exampleCustomSpotterOnAddressBook [

	GTSpotterMorph new
		extent: 400@500;
		spotterModel: (GTSpotter on: GtABAddressBook default);
		openCenteredInWorld
]

{ #category : #examples }
GtABAddressBook class >> exampleCustomSpotterOnAddressBookContactsOnly [

	GTSpotterMorph new
		extent: 400@500;
		spotterModel: (GTSpotter 
			on: GtABAddressBook default
			withProcessors: {
				GtABAddressBook>>#spotterForPeopleFor: });
		openCenteredInWorld
]

{ #category : #'class initialization' }
GtABAddressBook class >> initialize [

	"ABAddressBook default loadFromFile: 'data/cartoon.adr'."
	self reset
]

{ #category : #private }
GtABAddressBook class >> loadData [
	GtABAddressBook default contacts add: (
	GtABContact new
		firstName: 'Andrei';
		lastName: 'Chis';
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland';
				telephone: (GtABTelephone  new prefix: '41-7'; number: '12345678'))).
				
	GtABAddressBook default contacts add: (
	GtABContact new
		firstName: 'Aliaksei';
		lastName: 'Syrel';
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland';
				telephone: (GtABTelephone  new  prefix: '41-7'; number: '11223344'))).
				
	GtABAddressBook default contacts add: (
	GtABContact new
		firstName: 'Tudor';
		lastName: 'Girba';
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland';
				telephone: (GtABTelephone  new prefix: '41-7'; number: '11224455'))).
				
				
	GtABAddressBook default contacts add: (
	GtABContact new
		firstName: 'Juraj';
		lastName: 'Kubelka';
		address: (
			GtABAddress new
				city: 'Santiago';
				country: 'Chile';
				telephone: (GtABTelephone  new prefix: '56-5'; number: '54321345'))).
				
	GtABAddressBook default contacts add: (
	GtABContact new
		firstName: 'Stefan';
		lastName: 'Reichhart';
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland';
				telephone: (GtABTelephone  new prefix: '33-5'; number: '55326449'))).
				
	GtABAddressBook default contacts add: (
	GtABContact new
		firstName: 'John';
		lastName: 'Doe';
		address: (
			GtABAddress new
				city: 'Lille';
				country: 'France';
				telephone: (GtABTelephone  new prefix: '33-5'; number: '32455555'))).
			
		
]

{ #category : #accessing }
GtABAddressBook class >> reset [
	default := nil
]

{ #category : #adding }
GtABAddressBook >> addContacts: aList [

	self contacts addAll: aList
]

{ #category : #adding }
GtABAddressBook >> addFirst: first last: last [
	^self contacts add: (GtABContact first: first last: last)
	
]

{ #category : #accessing }
GtABAddressBook >> contacts [
	^ contacts ifNil: [ contacts := OrderedCollection new ]
]

{ #category : #accessing }
GtABAddressBook >> contacts: anObject [
	contacts := anObject
]

{ #category : #filtering }
GtABAddressBook >> contactsWithAddress: anAddress [
	^self contacts select: [ :each | each address = anAddress ] 
]

{ #category : #filtering }
GtABAddressBook >> contactsWithTelephone: aNumber [
	^self contacts select: [ :each | each address telephone number = aNumber ] 
]

{ #category : #printing }
GtABAddressBook >> gtContactsOn: aComposite [
	<gtInspectorPresentationOrder: 5>
	aComposite table
		title: 'Contacts';
		display: [ self contacts ];
		column: 'Name' evaluated: [ :aContact | aContact fullName ];
		column: 'Telephone' evaluated: [ :aContact | 
			aContact address telephone fullNumber ]
]

{ #category : #accessing }
GtABAddressBook >> label [
	^ label
]

{ #category : #accessing }
GtABAddressBook >> label: anObject [
	label := anObject
]

{ #category : #adding }
GtABAddressBook >> loadFromFile: aPath [
	|newContacts|
	
	newContacts := ((XMLDOMParser parse: aPath asFileReference) // 'contact') 
		collect: [ :each | GtABContact fromXML: each ].
	self addContacts: newContacts.
]

{ #category : #printing }
GtABAddressBook >> printOn: aStream [

	aStream nextPutAll: self label
]

{ #category : #searching }
GtABAddressBook >> spotterForAddressesFor: aStep [
	<spotterOrder: 10>
	^ aStep listProcessor 
		title: 'Addresses';
		allCandidates: [ (self contacts collectAsSet: #address) asOrderedCollection ];
		candidatesLimit: 7;
		itemName: [:each | each city, ', ', each country];
		matchSubstrings
]

{ #category : #searching }
GtABAddressBook >> spotterForPeopleFor: aStep [
	<spotterOrder: 5>
	^ aStep listProcessor 
		title: 'People';
		allCandidates: [ self contacts ];
		filter: GTFilterSubstrings;
		candidatesLimit: 7;
		itemName: [ :aContact | aContact lastName asUppercase, ', ' , aContact firstName ]
]

{ #category : #searching }
GtABAddressBook >> spotterForTelephonesFor: aStep [
	<spotterOrder: 15>
	^ aStep listProcessor 
		title: 'Telephones';
		allCandidates: [ self contacts collect: [ :aContact | aContact address telephone ] ];
		matchSubstrings
]

{ #category : #printing }
GtABAddressBook >> spotterPreviewIn: aComposite [
	<spotterPreview: 10>
	
	aComposite list
		title: 'People';
		display: #yourself;
		format: [ :contact | GTSpotterItemBrick new text: contact fullName; disable ];
		entity: self contacts
]