using EmployeesService from '../../services/DraftService';

annotate EmployeesService.Employees with @(
    UI : {
        Identification :[
            {Value : ID},
             {	
                $Type  : 'UI.DataFieldForAction',	
                Label  : 'Activate',	
                Action: 'EmployeesService.Activate',
                ![@UI.Hidden]: isHideActivateButton	
            },	
            {	
                $Type  : 'UI.DataFieldForAction',	
                Label  : 'Deactivate',	
                Action: 'EmployeesService.Deactivate',
                ![@UI.Hidden]: isHideDeactivateButton
            }
        ],
        HeaderInfo : {
            TypeName : '{i18n>TITLE_EMPLOYEE}',
            TypeNamePlural : '{i18n>TITLE_EMPLOYEES}',
            Title : { $Type : 'UI.DataField', Value : identifier },
            Description : { $Type : 'UI.DataField', Value : name},
            ImageUrl : 'sap-icon://employee'
        },
        HeaderFacets: [
            {$Type : 'UI.ReferenceFacet', Target : '@UI.FieldGroup#HeaderDetails', Label : 'Form'},
            {$Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#Status'},
            {$Type : 'UI.ReferenceFacet', Target : '@UI.FieldGroup#HeaderDetailsContact',Label : 'Contact'}
        ],
        Facets : [
            {
                $Type  : 'UI.CollectionFacet',
                Label  : '{i18n>GENERAL_INFORMATION}',
                ID     : 'GeneralInformationFacet',
                 
                Facets : [
                    {
                        $Type  : 'UI.ReferenceFacet',
                        ID     : 'SubSectionMainDetails',
                        Label  : '{i18n>MAIN_DETAILS}',
                        Target : '@UI.FieldGroup#MainDetails'
                    },
                    {
                        $Type  : 'UI.ReferenceFacet',
                        ID     : 'SubSectionAdditionalDetails',
                        Label  : '{i18n>ADDITIONAL_DETAILS}',
                        Target : '@UI.FieldGroup#AdditionalDetails'
                    },
                    {
                        $Type  : 'UI.ReferenceFacet',
                        ID     : 'SubSectionAdminData',
                        Label  : '{i18n>ADMIN_DATA}',
                        Target : '@UI.FieldGroup#Admin'
                    }
                ]
            },
            {
                $Type  : 'UI.CollectionFacet',
                Label  : '{i18n>SKILL_RELATIONSHIP}',
                ID     : 'SkillFacet',
                Facets : [
                    {
                        $Type  : 'UI.ReferenceFacet',
                        ID     : 'SubSectionSkillRelationship',
                        Target : 'skills/@UI.LineItem'
                    },
                ]
            }
        ],
        FieldGroup#MainDetails:{
            Data  : [
                {$Type : 'UI.DataField', Value : identifier},
                {$Type : 'UI.DataField', Value : name},
                {$Type : 'UI.DataField', Value : birthDate},
              //  {$Type : 'UI.DataField', Value : status_ID},
                {$Type : 'UI.DataField', Value : role_ID}
            ]
        },
        FieldGroup#AdditionalDetails :{
            Data  : [
                {$Type : 'UI.DataField', Value : company_ID},
                {$Type : 'UI.DataField', Value : address},
                {$Type : 'UI.DataField', Value : mobile},
                {$Type : 'UI.DataField', Value : email}
            ]
        },
        FieldGroup#Admin :{
            Data  : [
                {$Type : 'UI.DataField', Value : createdAt},
                {$Type : 'UI.DataField', Value : createdBy},
                {$Type : 'UI.DataField', Value : modifiedAt},
                {$Type : 'UI.DataField', Value : modifiedBy},
                {$Type  : 'UI.DataFieldForAction',	Label  : 'Activate', Action: 'EmployeesService.Activate' },
                {
                    $Type : 'UI.DataFieldForIntentBasedNavigation',	
                    Label : 'Annotation Navigation',
                    Action : 'display',
                    SemanticObject  : 'project1'
                }
            ]
        },
        FieldGroup#HeaderDetails:{
            Data  : [
                {$Type : 'UI.DataField', Value : identifier},
                {$Type : 'UI.DataField', Value : name}
            ]
        },
        FieldGroup#HeaderDetailsContact:{
            Data  : [
                {$Type : 'UI.DataField', Value : company_ID}
            ]
        },
        DataPoint#Status:{
            Value: status_ID,
            Criticality: status_ID,
            CriticalityRepresentation : #WithoutIcon,
            Title : 'Status'
        },
    },
);