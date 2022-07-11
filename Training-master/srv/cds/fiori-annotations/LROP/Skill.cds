using EmployeesService from '../../services/DraftService';

annotate EmployeesService.Skills with {
    ID
    @UI.Hidden;

    name
    @Common.Label  : 'Name';

    rating
    @Common.Label  : 'Rating';

    startLearningTime
    @Common.FieldControl : #Mandatory
    @Common.Label  : 'Start Date';

    endLearningTime
    @Common.FieldControl : #Mandatory
    @Common.Label  : 'End Date';
}