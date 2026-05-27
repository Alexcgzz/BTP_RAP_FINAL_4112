@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item Projection'
@Metadata.allowExtensions: true
define view entity ZC_SO_ITEM_4112
  as projection on ZI_SO_ITEM_4112
{
  key Id,
      SalesOrderUuid,
      SalesOrderId,
      Name,
      Description,
      ReleaseDate,
      DiscontinuedDate,
      Price,
      Height,
      Width,
      Depth,
      Quantity,
      UnitOfMeasure,

      _Header : redirected to parent ZC_SO_HEADER_4112
}
