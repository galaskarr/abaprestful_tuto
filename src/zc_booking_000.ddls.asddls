@EndUserText.label: 'Booking BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZC_BOOKING_000
  as projection on ZI_Booking_000 as Booking
{
      //ZI_BOOKING_000
  key Booking,
      CustomerName,
      NumberOfPassengers,
      EmailAddress,
      country,
      DateOfBooking,
      DateOfTravel,
      cost,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      //ZI_BOOKING_000
      _Country,
      _Currency
}
