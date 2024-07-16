// namespace my.bookshop;

// using
// {
//     cuid,
//     managed
// }
// from '@sap/cds/common';

// entity Books
// {
//     key ID : Integer;
//     title : String;
//     stock : Integer;
// }

// entity Authors : cuid, managed
// {
//     name : String(100);
//     books : Association to one Books;
// }


namespace my.bookshop;
using {
managed,
cuid,
User,
sap.common.CodeList
} from '@sap/cds/common';

entity Risks : cuid, managed {
title : String(100);
owner : String;
prio : Association to Priority;
descr : String;
miti : Association to Mitigations;
impact : Integer;
bp : Association to BusinessPartners;
virtual criticality : Integer;
virtual PrioCriticality : Integer;
}

entity Mitigations : cuid, managed {
descr : String;
owner : String;
timeline : String;
risks : Association to many Risks
on risks.miti = $self;
}

entity Priority : CodeList {
key code : String enum {
high = 'H';
medium = 'M';
low = 'L';
};
}

using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER.csn';
entity BusinessPartners as projection on external.A_BusinessPartner {
key BusinessPartner,
BusinessPartnerFullName as FullName,
}

//new changes
