CLASS zcl_generate_bookings_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_bookings_000 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA:it_bookings TYPE TABLE OF ztbooking_000.

*    read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).
*   fill internal table (itab)
    it_bookings = VALUE #(
        ( booking  = '1' customername = 'Buchholm' numberofpassengers = '3' emailaddress = 'tester1@flight.example.com'
          country = 'Germany' dateofbooking ='20180213125959' dateoftravel ='20180213125959' cost = '546' currencycode = 'EUR' lastchangedat = zv_tsl )
        ( booking  = '2' customername = 'Jeremias' numberofpassengers = '1' emailaddress = 'tester2@flight.example.com'
          country = 'USA' dateofbooking ='20180313125959' dateoftravel ='20180313125959' cost = '1373' currencycode = 'USD' lastchangedat = zv_tsl )
        ( booking  = '3' customername = 'Joe' numberofpassengers = '2' emailaddress = 'tester3@flight.example.com'
          country = 'BRA' dateofbooking ='20180413125959' dateoftravel ='20180413125959' cost = '1999' currencycode = 'BRL' lastchangedat = zv_tsl )
        ( booking  = '4' customername = 'Zé' numberofpassengers = '2' emailaddress = 'tester4@flight.example.com'
          country = 'BRA' dateofbooking ='20180513125959' dateoftravel ='20180513125959' cost = '3999' currencycode = 'BRL' lastchangedat = zv_tsl )
        ( booking  = '5' customername = 'Bastião' numberofpassengers = '5' emailaddress = 'tester5@flight.example.com'
          country = 'BRA' dateofbooking ='20180613125959' dateoftravel ='20180613125959' cost = '7999' currencycode = 'BRL' lastchangedat = zv_tsl )
     ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ztbooking_000.
*   insert the new table entries
    INSERT ztbooking_000 FROM TABLE @it_bookings.

*   check the result
    SELECT * FROM ztbooking_000 INTO TABLE @it_bookings.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!').

  ENDMETHOD.

ENDCLASS.
