using com.sap as db from '../../../../db/cds/index';

@cds.autoexpose
annotate db.status.Statuses   with {
    ID 
    @UI.Hidden : true
    @Common : {
        Label                    : 'ID',
        Text  : {
            $value                : name,
           ![@UI.TextArrangement] : #TextOnly
            }
    };  
    name @Common : {
        Label        : 'Status'
    };
};

annotate db.status.Status  with @(
    Common.ValueListMapping : {
        Label          : 'Status',
        CollectionPath : 'Statuses',
        Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'ID',
                LocalDataProperty : status_ID
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            }
        ]
    },Common.ValueListWithFixedValues
);