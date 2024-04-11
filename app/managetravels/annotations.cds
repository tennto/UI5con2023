using TravelService as service from '../../srv/travel-service';
using from '../value-helps';
annotate service.Travel with @(
    UI.SelectionFields : [
        to_Agency_AgencyID,
        to_Customer_CustomerID,
        TravelStatus_code,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : TravelID,
        },
        {
            $Type : 'UI.DataField',
            Value : TravelStatus_code,
            Criticality : TravelStatus.criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : BeginDate,
        },
        {
            $Type : 'UI.DataField',
            Value : EndDate,
        },
        {
            $Type : 'UI.DataField',
            Value : to_Agency_AgencyID,
        },
        {
            $Type : 'UI.DataField',
            Value : to_Customer_CustomerID,
        },
        {
            $Type : 'UI.DataField',
            Value : TotalPrice,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'TravelService.acceptTravel',
            Label : '{i18n>Accepttravel}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'TravelService.rejectTravel',
            Label : '{i18n>Rejecttravel}',
        },
    ],
);

annotate service.Travel with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>Travel}',
        TypeNamePlural : '{i18n>Travels}',
        Title : {
            $Type : 'UI.DataField',
            Value : Description,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : TravelID,
        },
    }
);
annotate service.Travel with @(
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'TravelService.acceptTravel',
            Label : '{i18n>AcceptTravel}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'TravelService.rejectTravel',
            Label : '{i18n>RejectTravel}',
        },
    ]
);
annotate service.Travel with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Travel}',
            ID : 'i18nTravel',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Travel}',
                    ID : 'Travel',
                    Target : '@UI.FieldGroup#Travel',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Prices}',
                    ID : 'i18nPrices',
                    Target : '@UI.FieldGroup#i18nPrices',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Dates}',
                    ID : 'i18nDates',
                    Target : '@UI.FieldGroup#i18nDates',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Sustainability}',
                    ID : 'i18nSustainability',
                    Target : '@UI.FieldGroup#i18nSustainability',
                },],
        },
    ]
);
annotate service.Travel with @(
    UI.FieldGroup #Travel : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : TravelID,
                Label : '{i18n>TravelID}',
            },{
                $Type : 'UI.DataField',
                Value : to_Agency_AgencyID,
                Label : '{i18n>AgencyID}',
            },{
                $Type : 'UI.DataField',
                Value : to_Customer_CustomerID,
                Label : '{i18n>CustomerID}',
            },{
                $Type : 'UI.DataField',
                Value : TravelStatus_code,
                Label : '{i18n>TravelStatus}',
            },],
    }
);
annotate service.Travel with @(
    UI.FieldGroup #Prices : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Travel with @(
    UI.FieldGroup #i18nPrices : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : BookingFee,
                Label : '{i18n>BookingFee}',
            },{
                $Type : 'UI.DataField',
                Value : TotalPrice,
                Label : '{i18n>TotalPrice}',
            },],
    }
);
annotate service.Travel with @(
    UI.FieldGroup #i18nDates : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : BeginDate,
                Label : '{i18n>BeginDate}',
            },{
                $Type : 'UI.DataField',
                Value : EndDate,
                Label : '{i18n>EndDate}',
            },],
    }
);
annotate service.Travel with {
    to_Customer @Common.ValueList : {
        CollectionPath : 'Passenger',
        Label : '{i18n>CustomerId}',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : to_Customer_CustomerID,
                ValueListProperty : 'CustomerID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'FirstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'LastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Title',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Street',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'PostalCode',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'City',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'CountryCode_code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'PhoneNumber',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'EMailAddress',
            },
        ],
    }
};
annotate service.Travel with @(
    UI.FieldGroup #i18nSustainability : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GoGreen,
            },{
                $Type : 'UI.DataField',
                Value : GreenFee,
            },{
                $Type : 'UI.DataField',
                Value : TreesPlanted,
            },],
    }
);

annotate service.Booking with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : to_Carrier.AirlinePicURL,
            Label : 'AirlinePicURL',
        },
        {
            $Type : 'UI.DataField',
            Value : BookingID,
        },      
        {
            $Type : 'UI.DataField',
            Value : to_Customer_CustomerID,
        },{
            $Type : 'UI.DataField',
            Value : to_Carrier_AirlineID,
        },{
            $Type : 'UI.DataField',
            Value : ConnectionID,
        },{
            $Type : 'UI.DataField',
            Value : FlightDate,
        },{
            $Type : 'UI.DataField',
            Value : FlightPrice,
        },
        {
            $Type : 'UI.DataField',
            Value : BookingStatus_code,
        },]
);