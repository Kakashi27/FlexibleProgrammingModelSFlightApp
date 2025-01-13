using TravelService as service from '../../srv/travel-service';
using from '../../db/schema';


annotate service.Travel with @(
    UI.SelectionFields               : [
        to_Agency.AgencyID,
        to_Customer.CustomerID,
        TravelStatus.code,
        TravelID
    ],
    UI.LineItem                      : [
        {
            $Type: 'UI.DataField',
            Value: TravelID,
            Label: 'Travel Id'
        },
        {
            $Type      : 'UI.DataField',
            Value      : TravelStatus_code,
            Criticality: TravelStatus.criticality,
            Label      : 'Travel Status'
        },
        {
            $Type: 'UI.DataField',
            Value: BeginDate,
            Label: 'Begin Date'
        },
        {
            $Type: 'UI.DataField',
            Value: EndDate,
            Label: 'End Date'
        },
        {
            $Type: 'UI.DataField',
            Value: to_Agency_AgencyID,
            Label: 'Agency ID'
        },
        {
            $Type: 'UI.DataField',
            Value: to_Customer_CustomerID,
            Label: 'Customer ID'
        },
        {
            $Type: 'UI.DataField',
            Value: TotalPrice,
            Label: 'Total Price'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'TravelService.acceptTravel',
            Label : '{i18n>acceptTravel}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'TravelService.rejectTravel',
            Label : '{i18n>rejectTravel}',
        },
    ],
    UI.HeaderInfo                    : {
        TypeName      : '{i18n>Travel}',
        TypeNamePlural: '{i18n>Travels}',
        Title         : {
            $Type: 'UI.DataField',
            Value: TravelID,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: Description,
        },
    },
    UI.Identification                : [
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'TravelService.acceptTravel',
            Label : '{i18n>acceptTravel}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'TravelService.rejectTravel',
            Label : '{i18n>rejectTravel}',
        },
    ],
    UI.Facets                        : [{
        $Type : 'UI.CollectionFacet',
        Label : '{i18n>Travel}',
        ID    : 'i18nTravel',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>Travel}',
                ID    : 'i18nTravel1',
                Target: '@UI.FieldGroup#i18nTravel',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>Prices}',
                ID    : 'i18nPrices',
                Target: '@UI.FieldGroup#i18nPrices',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>Dates}',
                ID    : 'i18nDates',
                Target: '@UI.FieldGroup#i18nDates',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>Sustainability}',
                ID    : 'i18nSustainability',
                Target: '@UI.FieldGroup#i18nSustainability',
            },
        ],
    },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>MyItinerary}',
            ID : 'i18nMyItinerary',
            Target : 'to_Booking/@UI.LineItem#i18nMyItinerary',
        },
         ],
    UI.FieldGroup #i18nTravel        : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: TravelID,
                Label: 'TravelID',
            },
            {
                $Type: 'UI.DataField',
                Value: to_Agency.AgencyID,
                Label: 'AgencyID',
            },
            {
                $Type: 'UI.DataField',
                Value: to_Customer.CustomerID,
                Label: 'CustomerID',
            },
            {
                $Type: 'UI.DataField',
                Value: TravelStatus_code,
                Label: 'TravelStatus_code',
            },
        ],
    },
    UI.FieldGroup #i18nPrices        : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: BookingFee,
                Label: 'Booking Fees'
            },
            {
                $Type: 'UI.DataField',
                Value: TotalPrice,
                Label: 'Total Price'
            }
        ],
    },
    UI.FieldGroup #i18nDates         : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: BeginDate,
                Label: 'Begin Date'
            },
            {
                $Type: 'UI.DataField',
                Value: EndDate,
                Label: 'End Date'
            }
        ],
    },
    UI.FieldGroup #i18nSustainability: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: GoGreen,
                Label: 'Go Green'
            },
            {
                $Type: 'UI.DataField',
                Value: GreenFee,
                Label: 'Green Fee'
            },
            {
                $Type: 'UI.DataField',
                Value: TreesPlanted,
                Label: 'Trees Planted'
            }
        ],
    },
);

annotate service.TravelStatus with {
    code @Common.Label: '{i18n>TravelStatus}'
};
annotate service.Booking with @(
    UI.LineItem #i18nMyItinerary : [
        {
            $Type : 'UI.DataField',
            Value : to_Carrier.AirlinePicURL,
            Label : 'AirlinePicURL',
        },
        {
            $Type : 'UI.DataField',
            Value : BookingID,
            Label : 'BookingID',
        },
        {
            $Type : 'UI.DataField',
            Value : to_Customer.CustomerID,
            Label : 'CustomerID',
        },
        {
            $Type : 'UI.DataField',
            Value : to_Carrier.AirlineID,
            Label : 'AirlineID',
        },
        {
            $Type : 'UI.DataField',
            Value : ConnectionID,
            Label : 'ConnectionID',
        },
        {
            $Type : 'UI.DataField',
            Value : FlightDate,
            Label : 'FlightDate',
        },
        {
            $Type : 'UI.DataField',
            Value : FlightPrice,
            Label : 'FlightPrice',
        },
        {
            $Type : 'UI.DataField',
            Value : BookingStatus_code,
            Label : 'BookingStatus_code',
        },
    ]
);

