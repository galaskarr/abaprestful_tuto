@AbapCatalog.sqlViewName: 'ZV_BOOKING_000'
@AbapCatalog.compiler.compareFilter : true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label : 'Data Definition Booking'
@Search.searchable : true

define root view ZI_Booking_000
  as select from ztbooking_000 as Booking
  association [0..1] to I_Country  as _Country  on $projection.country = _Country.Country
  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{

 @Search.defaultSearchElement: true
  key booking            as Booking,
      customername       as CustomerName,
      numberofpassengers as NumberOfPassengers,
      emailaddress       as EmailAddress,
      country,
      dateofbooking      as DateOfBooking,
      dateoftravel       as DateOfTravel,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      cost,

      @Semantics.currencyCode: true
      currencycode       as CurrencyCode,
      lastchangedat      as LastChangedAt,

      //public associations
      _Country,
      _Currency
}
