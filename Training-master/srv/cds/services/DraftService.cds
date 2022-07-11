using com.sap as demo from '../../../db/index';

service EmployeesService {
    entity Employees as projection on demo.employee.Employees actions {
        @(Common.SideEffects : {
            TargetProperties : ['status_ID']
            },
           cds.odata.bindingparameter.name : '_it',
           Core.OperationAvailable         : _it.isActive
        )
        action Deactivate() returns Employees;
        @(Common.SideEffects : {
            TargetProperties : ['status_ID']
            },
           cds.odata.bindingparameter.name : '_it',
           Core.OperationAvailable         : _it.isInActive
        )
        action Activate() returns Employees;
    };
}