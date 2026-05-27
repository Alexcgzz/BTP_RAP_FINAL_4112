@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Item Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_SO_ITEM_4112
  as select from zso_itm_4112
  association to parent ZI_SO_HEADER_4112 as _Header on $projection.SalesOrderUuid = _Header.Uuid
{
  key id               as Id,
      salesorderuuid   as SalesOrderUuid,
      salesorderid     as SalesOrderId,
      name             as Name,
      description      as Description,
      releasedate      as ReleaseDate,
      discontinueddate as DiscontinuedDate,
      price            as Price,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      height           as Height,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      width            as Width,
      depth            as Depth,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      quantity         as Quantity,
      unitofmeasure    as UnitOfMeasure,

      _Header
}
