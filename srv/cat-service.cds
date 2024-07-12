// using my.bookshop as my from '../db/data-model';
// service CatalogService {
//      entity Books as projection on my.Books;
//     entity Authors as projection on my.Authors;
// }

using my.bookshop as my from '../db/data-model';
@path: 'service/risk'
service CatalogService{
entity Risks 
@(restrict: [
{
grant: 'READ',
to : 'RiskViewer'
},
{
grant: [
'READ',
'WRITE',
'UPDATE',
'UPSERT',
'DELETE'
], // Allowing CDS events by explicitly mentioning them
to : 'RiskManager'
}
]) 
as projection on my.Risks;
annotate Risks with @odata.draft.enabled;
entity Mitigations 
@(restrict: [
{
grant: 'READ',
to : 'RiskViewer'
},
{
grant: '*', // Allow everything using wildcard
to : 'RiskManager'
}
]) 
as projection on my.Mitigations;
annotate Mitigations with @odata.draft.enabled;
// BusinessPartner will be used later
@readonly entity BusinessPartners as projection on my.BusinessPartners;
}
