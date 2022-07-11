namespace com.sap.status;

type Status : Association to one Statuses;

entity Statuses  {
  key ID   : Integer;
      name : localized String;
}