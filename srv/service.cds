using my.FairContacts as fc from '../db/schema';

service FairContactsService {
	entity BusinessPartner as projection on fc.BusinessPartner;
	entity TypeOfContact as projection on fc.TypeOfContact;
	entity ApplicationPurpose as projection on fc.ApplicationPurpose;
	entity Status as projection on fc.Status;
	entity Grade as projection on fc.Grade;
	entity Semester as projection on fc.Semester;
	entity University as projection on fc.University;
	entity FieldOfStudy as projection on fc.FieldOfStudy;
	entity FormOfAddress as projection on fc.FormOfAddress;
	entity BusinessCard as projection on fc.BusinessCard;
	entity Address as projection on fc.Address;
	entity Attachments as projection on fc.Attachments;
	//type addressShort as projection on fc.addressShort;
	/* entity Countries as projection on sap.common.Countries;*/
	//functions
	function ValidateAddressGet(addressText : String) returns Address;
	//actions
	//vallidate Address
	action ValidateAddress(addressText : String) returns Address;
	//test Action
	action greedAsAction(to : String) returns String;
	//sap help e.g. action https://help.sap.com/viewer/65de2977205c403bbc107264b8eccf4b/Cloud/en-US/7347f9d7aff44a2eac950b7be8fe395d.html
	action applyProductDiscount ( productID:Integer, reason:String );
	//gets an text returns possible addresse
	action getAddressDescriptions(addressText : String, Container : String ) returns array of Address;

	action getAddressInfo(id : String)returns Address;
	//gets a photo of a card returns BusinessPartner
	//action scannCard(photoId : String) returns BusinessPartner; //photo type ?
	//for testing stuff
	action test(req : String) returns array of Address;
	//returns address descriptions for autofill
	action addressAutoFill(addressText : String) returns array of Address;
}