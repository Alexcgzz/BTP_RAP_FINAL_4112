@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_SO_HEADER_4112
  as select from zso_hdr_4112
  composition [0..*] of ZI_SO_ITEM_4112 as _Items
{
  key uuid              as Uuid,
      id                as Id,
      email             as Email,
      firstname         as FirstName,
      lastname          as LastName,
      country           as Country,
      createdon         as CreatedOn,
      deliverydate      as DeliveryDate,
      orderstatus       as OrderStatus,
      imageurl          as ImageUrl,
      locallastchangedat as LocalLastChangedAt,

      _Items
}
