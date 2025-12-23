using MyService as service from '../../srv/so-service';
annotate service.SalesOrderApproval with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'SalesOrg',
                Value : SalesOrg,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SoldToParty',
                Value : SoldToParty,
            },
            {
                $Type : 'UI.DataField',
                Label : 'netValue',
                Value : netValue,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency_code',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'approverComment',
                Value : approverComment,
            },
            {
                $Type : 'UI.DataField',
                Label : 'approvalStatus',
                Value : approvalStatus,
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'SalesOrg',
            Value : SalesOrg,
        },
        {
            $Type : 'UI.DataField',
            Label : 'netValue',
            Value : netValue,
        },
        {
            $Type : 'UI.DataField',
            Label : 'currency_code',
            Value : currency_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'approverComment',
            Value : approverComment,
        },
        {
            $Type : 'UI.DataField',
            Value : approvalStatus,
            Label : 'approvalStatus',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MyService.approveSalesOrder',
            Label : 'approveSalesOrder',
            Inline : true,
            @UI.Hidden: {$edmJson:{$Not:{$Path: 'Configuration/isManager'}}}
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MyService.rejectSalesOrder',
            Label : 'rejectSalesOrder',
            Inline : true,
            @UI.Hidden: {$edmJson:{$Not:{$Path: 'Configuration/isManager'}}}
        },
    ],
    UI.SelectionFields : [
        ID,
        netValue,
        approvalStatus,
    ],
);

annotate service.SalesOrderApproval with {
    ID @Common.Label : 'ID'
};

annotate service.SalesOrderApproval with {
    netValue @Common.Label : 'netValue'
};

annotate service.SalesOrderApproval with {
    approvalStatus @Common.Label : 'approvalStatus'
};

