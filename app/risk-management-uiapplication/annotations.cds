using CatalogService as service from '../../srv/cat-service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Risks Overview',
            ID : 'RisksOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Risk Details',
                    ID : 'RiskDetails',
                    Target : '@UI.FieldGroup#RiskDetails',
                },],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Mitigations',
            ID : 'Mitigations',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Mitigation Details',
                    ID : 'MitigationDetails',
                    Target : '@UI.FieldGroup#MitigationDetails',
                },],
        },],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Priority',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Description}',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Value : impact,
            Label : '{i18n>Impact}',
            Criticality : criticality,
        },
    ],
);

annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'timeline',
            },
        ],
    }
};

annotate service.Risks with @(
    UI.SelectionFields : [
        prio_code,
    ]
);
annotate service.Risks with {
    prio @Common.Label : '{i18n>Priority}'
};
annotate service.Risks with @(
    UI.FieldGroup #RiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : '{i18n>Id}',
            },{
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
            },{
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Owner}',
            },{
                $Type : 'UI.DataField',
                Value : prio_code,
            },],
    }
);
annotate service.Risks with @(
    UI.HeaderInfo : {
        TypeImageUrl : 'sap-icon://alert',
        TypeName : '',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
    }
);
annotate service.Risks with @(
    UI.FieldGroup #MitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti.ID,
                Label : '{i18n>Id}',
            },{
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : '{i18n>Owner}',
            },{
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : '{i18n>Timeline}',
            },{
                $Type : 'UI.DataField',
                Value : miti.descr,
                Label : 'Description',
            },],
    }
);
annotate service.Mitigations with {
    ID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : 'ID',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : {
                $value : descr,
                ![@UI.TextArrangement] : #TextFirst,
            }
)};
annotate service.Risks with {
    ID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Risks',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : 'ID',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Risks with {
    impact @Common.FieldControl : #ReadOnly
};