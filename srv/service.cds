using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using { com.knauf.demo as my } from '../db/schema';

@path : '/service/RiskManageSvcs'
service RiskManageService
{
    annotate Actions with @restrict :
    [
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    annotate Mitigations with @restrict :
    [
        { grant : [ '*' ], to : [ 'RiskManager' ] },
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] }
    ];

    annotate Risks with @restrict :
    [
        { grant : [ '*' ], to : [ 'RiskManager' ] },
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] }
    ];

    entity Risks as
        projection on my.Risks
        {
            *
        };

    entity Mitigations as
        projection on my.Mitigations
        {
            *
        };

    entity Actions as
        projection on my.Actions;

    entity A_BusinessPartner as
        projection on BusinessPartnerA2X.A_BusinessPartner
        {
            BusinessPartner,
            Customer,
            Supplier,
            BusinessPartnerCategory,
            BusinessPartnerFullName,
            BusinessPartnerIsBlocked
        };
}

annotate RiskManageService with @requires :
[
    'authenticated-user',
    'RiskManager',
    'RiskViewer'
];
