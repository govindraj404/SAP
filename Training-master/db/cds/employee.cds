namespace com.sap.employee;

using { cuid, managed } from '@sap/cds/common';
using {com.sap.skill.Skills} from './index';
using {com.sap.role.Role} from './index';
using {com.sap.status.Status} from './index';
using {com.sap.company.Company} from './index';

entity Employees : cuid, managed {
    identifier      : Integer;
    name            : String;
    birthDate       : Date;
    address         :  String;
    mobile          : Integer;
    email           : String;
    collegeName     : String;
    startYear       : Date;
    endYear         : Date;
    role            : Role;
    status          : Status;
    company         : Company;
    skills          : Composition of many Skills on skills.parentID =  $self;
    virtual isActive         : Boolean;
    virtual isInActive      : Boolean;
    virtual isHideActivateButton    : Boolean;
    virtual isHideDeactivateButton  : Boolean;
}