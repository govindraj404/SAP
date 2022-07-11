using EmployeesService from '../../services/DraftService';

annotate EmployeesService.Skills with @(
    UI : {
        LineItem: {
            $value :[
                {$Type : 'UI.DataField', Value: name},
                {$Type : 'UI.DataField', Value: startLearningTime},
                {$Type : 'UI.DataField', Value: endLearningTime},
                //{ $Type: 'UI.DataField', Value: rating },
                {
                    $Type : 'UI.DataFieldForAnnotation',
                    Target : '@UI.DataPoint#RatingIndicator',
                    Label : 'Rating'
                },
                { $Type: 'UI.DataField', Value: createdAt },  
                { $Type: 'UI.DataField', Value: createdBy },
                { $Type: 'UI.DataField', Value: modifiedAt },
                { $Type: 'UI.DataField', Value: modifiedBy }             
            ]
        },
        DataPoint#RatingIndicator:{
            TargetValue : 5,
            Value: rating,
            Visualization :#Rating,
            Title : 'Rating Indicator'
        }
    }
);