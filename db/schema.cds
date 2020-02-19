namespace my.FairContacts;
using { Country, cuid , managed } from '@sap/cds/common';
//assosiation countries 
 
entity BusinessPartner : cuid , managed  { 
	
	//** Common Information **//
	emailAddress		: 		String(250);
	firstName			:		String(60) @( title: '{i18n>firstName}',);
	lastName			: 		String(60) @( title: '{i18n>lastName}',);
	telephoneNumber		:		String(40) ;
	mobile				:		String(40); 
	birthdate			:		DateTime;
	
	address				:		Association to Address;
	typeOfContact		:		Association to TypeOfContact;
	formOfAddress		:		Association to FormOfAddress ;
	grade				:		Association to Grade;
	status		   		:		Association to Status @( title: '{i18n>status}',);
	attachments			:		Composition of many Attachments on attachments.parent = $self;
	
	//** Optional Information **//
	smallComment		:		String (500);
	

	//** Applicant Information **//
	applicationPurpose	:		Association to  ApplicationPurpose;
	motivation			:		String(500);
	
	//** Student Information **//	
	fieldOfStudy		: 		Association to FieldOfStudy;
	semester			: 		Association to Semester;
	university			:		Association to University;
	
	//** Representative Information **// 	
	companyName 		:		String(80);
	position			:		String(60);
	legalForm			:		String(8);
	companyNumber		:		String(10);
	personNumber		:		String(10);
	
	//** Address Information **//
	highlight			:		String(100);
	street				:		String(100);
	housenumber			:		Integer;
	postalcode			:		Integer;
	country				:		Country @( title: '{i18n>country}',);
	city				:		String(86) @( title: '{i18n>city}',);
	countryIsoLoc		:		String(5);
	countryIsoGlob		:		String(10);
	countryIsoNumber	:		Integer;
	province			:		String(100);
	domesticId			:		String(100);
	addressLanguage		:		String(100);
	amountOfAddresses	:		String(100);
	autofillText		:		String(200);
	
 };
 
 entity Attachments : cuid, managed {
 	parent				:		Association to BusinessPartner;
 	mediaType			:		String;
 	fileName			:		String;
 	fileSize			:		Integer;
	title				:		String;
	thumbnailUrl		:		String;
 }
 
entity BusinessCard	: cuid, managed{
	scan	: LargeBinary;
	}
	
	
	
//@cds.persistence.exists
entity Address {//type
	key ID				:		String(100);
	addressType			:		String(20);
	addressText			:		String(100);
	description			:		String(100);
	
	
	
	//address data maby used later?
	highlight			:		String(100);
	street				:		String(100);
	housenumber			:		Integer;
	postalcode			:		Integer;
	country				:		Country;
	city				:		String(86);
	countryIsoLoc		:		String(5);
	countryIsoGlob		:		String(10);
	countryIsoNumber	:		Integer;
	province			:		String(100);
	domesticId			:		String(100);
	addressLanguage		:		String(100);
	amountOfAddresses	:		String(100);
	autofillText		:		String(200);
	
}

entity TypeOfContact  {
	key typ :	localized		String @title : '{i18n>typeOfContact}';
}

entity ApplicationPurpose {
	key typ :	localized		String @title : '{i18n>applicationPurpose}';
}

entity Status {
	key typ :	localized		String @title : '{i18n>status}';
}

entity Grade {
	key typ :	localized		String @title : '{i18n>grade}'; 
}

entity FormOfAddress {
	key typ :	localized		String @title : '{i18n>formOfAddress}';
}

entity Semester {
	key typ	:	localized		String @title : '{i18n>semester}';
}

entity FieldOfStudy {
	key typ :	localized		String @title : '{i18n>fieldOfStudy}';
}

entity University {
	key typ :	localized		String @title : '{i18n>university}';
}

// type addressShort{
//   	id					:		String;
//   	addressType			:		String;
//   	addressText			:		String;
//   	addressDescription	:		String;
//   }

