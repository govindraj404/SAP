using EmployeesService from '../../services/DraftService';

annotate EmployeesService.Employees with {
    ID
    @UI.Hidden;

    address
    @Common.Label  : 'Address';

    birthDate
    @Common.Label  : 'Birth Date';

    collegeName
    @Common.Label  : 'College Name';

    email
    @Common.Label  : 'Email';

    endYear
    @Common.Label  : 'End Year';

    identifier
    @Common.FieldControl : #ReadOnly
    @Common.Label  : 'ID';

    mobile
    @Common.Label  : 'Mobile';

    name
    @Common.Label  : 'Name';

    role
    @Common.Label  : 'Role';

    startYear
    @Common.Label  : 'Start Year';

    status
    @Common.FieldControl : #Mandatory
    @Common.Label  : 'Status';

    company
    @Common.Label  : 'Company';

    status  @Common : 
    {
        Text            : status.name,
        TextArrangement : #TextOnly
    };   

    company  @Common : 
    {
        Text            : company.name,
        TextArrangement : #TextOnly
    }; 

    role  @Common : 
    {
        Text            : role.name,
        TextArrangement : #TextOnly
    };   
}