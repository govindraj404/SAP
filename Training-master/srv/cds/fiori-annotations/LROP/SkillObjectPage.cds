using EmployeesService from '../../services/DraftService';

annotate EmployeesService.Skills with @(
    UI : {
        Identification :[
            {Value : ID}
        ],
        HeaderInfo : {
            TypeName : 'Skill',
            TypeNamePlural : 'Skills',
            Title : { $Type : 'UI.DataField', Value : name },
            Description : { $Type : 'UI.DataField', Value : name},
            ImageUrl : 'sap-icon://learning-assistant'
        },
        HeaderFacets: [
            {$Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#RatingIndicator'},
            {$Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#Rating'},
            {$Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#RatingProgress'}
        ],
        Facets : [
            {
                $Type  : 'UI.CollectionFacet',
                Label  : 'General Information',
                ID     : 'GeneralInformationFacet',
                Facets : [
                    {
                        $Type  : 'UI.ReferenceFacet',
                        ID     : 'SubSectionMainDetails',
                        Label  : 'Main Details',
                        Target : '@UI.FieldGroup#MainDetails'
                    },
                    {
                        $Type  : 'UI.ReferenceFacet',
                        ID     : 'SubSectionAdminData',
                        Label  : 'Admin Date',
                        Target : '@UI.FieldGroup#Admin'
                    }
                ]
            }
        ],
        FieldGroup#MainDetails:{
            Data  : [
                {$Type : 'UI.DataField', Value : name},
                {$Type : 'UI.DataField', Value : startLearningTime},
                {$Type : 'UI.DataField', Value : endLearningTime},
                {$Type : 'UI.DataField', Value : rating}
            ]
        },
        FieldGroup#Admin :{
            Data  : [
                {$Type : 'UI.DataField', Value : createdAt},
                {$Type : 'UI.DataField', Value : createdBy},
                {$Type : 'UI.DataField', Value : modifiedAt},
                {$Type : 'UI.DataField', Value : modifiedBy}
            ]
        },
        DataPoint#Rating:{
            Value: rating,
            Criticality: rating,
            CriticalityRepresentation : #WithIcon,
            Title : 'Rating DataPoint'
        },
        DataPoint#RatingProgress:{
            Value: rating,
            Visualization :#Progress,
            TargetValue : 5,
            Criticality : rating,
            Title : 'Rating Progress'
        }
    },
);
