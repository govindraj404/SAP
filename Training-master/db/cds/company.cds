namespace com.sap.company;

type Company : Association to one Companies;

entity Companies {
    key ID      : Integer;
        name    : String;
        address : String;
        mobile  : String;
        email   : String;
}