using EmployeesService from '../../services/DraftService';

annotate EmployeesService.Employees with @(
    odata.draft.enabled : true,
    
     Capabilities: {
        SearchRestrictions.Searchable : true,
        FilterRestrictions  : { 
            NonFilterableProperties : [
                mobile
            ],
            FilterExpressionRestrictions : [
                {
                    Property          : 'birthDate',
                    AllowedExpressions : 'SingleRange'
                }
            ]
        }
    },
    Common.SemanticKey  : [identifier],
    UI: {
        PresentationVariant: {
            RequestAtLeast:[mobile],
            Visualizations: ['@UI.LineItem'],
            SortOrder : [
                {
                    Property   : 'modifiedAt',
                    Descending : true
                }
            ]
        },
        SelectionVariant #All : {
            Text: '{i18n>ALL}',
            SelectOptions: [
                {
                    $Type     : 'UI.SelectOptionType',
                    PropertyName : status_ID,
                    Ranges: [{
                        $Type : 'UI.SelectionRangeType',
                        Sign : #I,
                        Option: #BT,
                        Low: 0,
                        High: 3
                    }
                    ]
                }
            ]
        }, 
        SelectionVariant #Active : {
            Text: 'Active',
            SelectOptions: [
                {
                    $Type     : 'UI.SelectOptionType',
                    PropertyName : status_ID,
                    Ranges: [{
                        $Type : 'UI.SelectionRangeType',
                        Sign : #I,
                        Option : #EQ,
                        Low : 3
                    }
                    ]
                }
            ]
        }, 
        SelectionVariant #New : {
            Text: 'New',
            SelectOptions: [
                {
                    $Type     : 'UI.SelectOptionType',
                    PropertyName : status_ID,
                    Ranges: [{
                        $Type : 'UI.SelectionRangeType',
                        Sign : #I,
                        Option : #EQ,
                        Low : 2
                    }
                    ]
                }
            ]
        },
        SelectionFields: [ birthDate, startYear, company_ID],
        LineItem: {
            $value :[
                {$Type : 'UI.DataField', Value: identifier},
                {$Type : 'UI.DataField', Value: name},
                {$Type : 'UI.DataField', Value: birthDate},
                {
                    $Type: 'UI.DataField',
                    Value: status_ID,
                    Criticality: status_ID,
                    CriticalityRepresentation : #WithIcon
                },  
                {
                    $Type: 'UI.DataFieldForAction', 
                    Label: 'Activate',
                    Action: 'EmployeesService.Activate'
                },
                {
                    $Type: 'UI.DataFieldForAction', 
                    Label: 'Deactivate',
                    Action: 'EmployeesService.Deactivate'
                }             
            ]
        }
    }
);