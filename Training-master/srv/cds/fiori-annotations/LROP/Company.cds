using com.sap as db from '../../../../db/cds/index';

@cds.autoexpose
annotate db.company.Companies   with {
    ID 
    @Common : {
        Label                    : 'ID',
        Text  : {
            $value                : name,
           ![@UI.TextArrangement] : #TextFirst
            }
    };  

    name @Common : {
        Label        : 'Name'
    };

    address @Common : {
        Label        : 'Address'
    };

    mobile @Common : {
        Label        : 'Mobile'
    };

    email @Common : {
        Label        : 'Email ID'
    };
    
};

annotate db.company.Company  with @(
    Common.ValueListMapping : {
        Label          : 'Company',
        CollectionPath : 'Companies',
        Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                ValueListProperty : 'ID',
                LocalDataProperty : company_ID
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'address'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'mobile'
            }
        ]
    }
);


annotate db.company.Companies with @(
    UI.HeaderInfo : {
        TypeName : 'Company',
        TypeNamePlural : 'Companies',
        Title : 
        {
            $Type : 'UI.DataField',
            Value : ID
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : name
        },
        ImageUrl : 'sap-icon://offsite-work'
    },
    UI.QuickViewFacets:[
        {
            $Type  :'UI.ReferenceFacet',
            Target :'@Communication.Contact'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label :'Company Details',
            Target :'@UI.FieldGroup#QuickView'
        }
    ],
    Communication.Contact : {
        fn   : name,
        email : [{
           type    : #work,
           address : email
        }],
        tel  : [
            {
                uri  : mobile,
                type : #cell
            },
            {
                uri  : email,
                type : #fax
            }
        ]
    },
    UI.FieldGroup#QuickView : {   
        Data : [
            {
                $Type : 'UI.DataField',
                Value : address,
                Label :'Address'
            },
            {
                $Type : 'UI.DataField',
                Value : mobile,
                Label :'Mobile'
            },
            {
                $Type : 'UI.DataField',
                Value : email,
                Label :'Email ID'
            }
        ]
    }
);