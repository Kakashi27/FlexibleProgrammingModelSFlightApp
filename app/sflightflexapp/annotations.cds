using TravelService as service from '../../srv/travel-service';
using from '../../db/schema';


annotate service.Travel with @(
    UI.SelectionFields: [
        to_Agency.AgencyID,
        to_Customer.CustomerID,
        TravelStatus.code,
        TravelID
    ],
    UI.LineItem       : [
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
    UI.HeaderInfo     : {
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
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'TravelService.acceptTravel',
            Label : '{i18n>acceptTravel}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'TravelService.rejectTravel',
            Label : '{i18n>rejectTravel}',
        },
    ],
);
annotate service.TravelStatus with {
    code @Common.Label : '{i18n>TravelStatus}'
};

