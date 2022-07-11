namespace com.sap.skill;

using { cuid, managed} from '@sap/cds/common';
using {com.sap.employee.Employees} from './index';
 
type Skill : Association to one Skills;

entity Skills : cuid,managed{
        name               : String;
        rating             : Integer;
        startLearningTime  : Timestamp;
        endLearningTime    : Timestamp;
        parentID           : Association to Employees;
}