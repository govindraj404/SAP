using com.sap as demo from '../../../db/index';

service EmployeesActiveService {
    entity EmployeesActive as projection on demo.employee.Employees;
    entity Roles             as projection on demo.role.Roles;
}