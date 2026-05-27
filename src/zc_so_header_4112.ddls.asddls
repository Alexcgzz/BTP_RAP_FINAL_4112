@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header Projection'
@Metadata.allowExtensions: true
define root view entity ZC_SO_HEADER_4112
  provider contract transactional_query
  as projection on ZI_SO_HEADER_4112
{
  key Uuid,
      Id,
      Email,
      FirstName,
      LastName,
      Country,
      CreatedOn,
      DeliveryDate,
      OrderStatus,
      ImageUrl,
      LocalLastChangedAt,

      _Items : redirected to composition child ZC_SO_ITEM_4112
}
