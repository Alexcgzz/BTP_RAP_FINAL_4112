CLASS zcl_so_data_4112 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_so_data_4112 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DELETE FROM zso_itm_4112.
    DELETE FROM zso_hdr_4112.
    COMMIT WORK.

    DATA: lt_header TYPE TABLE OF zso_hdr_4112,
          lt_item   TYPE TABLE OF zso_itm_4112.

    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).

    GET TIME STAMP FIELD DATA(lv_timestamp).

    DATA:
      lv_uuid_001 TYPE sysuuid_x16,
      lv_uuid_002 TYPE sysuuid_x16,
      lv_uuid_003 TYPE sysuuid_x16,
      lv_uuid_004 TYPE sysuuid_x16,
      lv_uuid_005 TYPE sysuuid_x16,
      lv_uuid_006 TYPE sysuuid_x16,
      lv_uuid_007 TYPE sysuuid_x16,
      lv_uuid_008 TYPE sysuuid_x16,
      lv_uuid_009 TYPE sysuuid_x16,
      lv_uuid_010 TYPE sysuuid_x16.

    lv_uuid_001 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_002 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_003 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_004 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_005 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_006 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_007 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_008 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_009 = cl_system_uuid=>create_uuid_x16_static( ).
    lv_uuid_010 = cl_system_uuid=>create_uuid_x16_static( ).

    lt_header = VALUE #(

      ( client = sy-mandt uuid = lv_uuid_001 id = 'SO001'
        email = 'john.doe@gmail.com' firstname = 'John' lastname = 'Doe'
        country = 'USA' createdon = lv_today deliverydate = lv_today + 5
        orderstatus = 1 imageurl = 'https://img1.com'
        locallastchangedat = lv_timestamp )

      ( client = sy-mandt uuid = lv_uuid_002 id = 'SO002'
        email = 'maria.lopez@gmail.com' firstname = 'Maria' lastname = 'Lopez'
        country = 'MEXICO' createdon = lv_today deliverydate = lv_today + 3
        orderstatus = 2 imageurl = 'https://img2.com'
        locallastchangedat = lv_timestamp )

      ( client = sy-mandt uuid = lv_uuid_003 id = 'SO003'
        email = 'alex.smith@gmail.com' firstname = 'Alex' lastname = 'Smith'
        country = 'CANADA' createdon = lv_today deliverydate = lv_today + 8
        orderstatus = 1 imageurl = 'https://img3.com'
        locallastchangedat = lv_timestamp )

      ( client = sy-mandt uuid = lv_uuid_004 id = 'SO004'
        email = 'emma.wilson@gmail.com' firstname = 'Emma' lastname = 'Wilson'
        country = 'UK' createdon = lv_today deliverydate = lv_today + 4
        orderstatus = 3 imageurl = 'https://img4.com'
        locallastchangedat = lv_timestamp )

      ( client = sy-mandt uuid = lv_uuid_005 id = 'SO005'
        email = 'li.chen@gmail.com' firstname = 'Li' lastname = 'Chen'
        country = 'CHINA' createdon = lv_today deliverydate = lv_today + 2
        orderstatus = 1 imageurl = 'https://img5.com'
        locallastchangedat = lv_timestamp )

      ( client = sy-mandt uuid = lv_uuid_006 id = 'SO006'
        email = 'sophia.king@gmail.com' firstname = 'Sophia' lastname = 'King'
        country = 'USA' createdon = lv_today deliverydate = lv_today + 6
        orderstatus = 2 imageurl = 'https://img6.com'
        locallastchangedat = lv_timestamp )

      ( client = sy-mandt uuid = lv_uuid_007 id = 'SO007'
        email = 'daniel.costa@gmail.com' firstname = 'Daniel' lastname = 'Costa'
        country = 'BRAZIL' createdon = lv_today deliverydate = lv_today + 7
        orderstatus = 1 imageurl = 'https://img7.com'
        locallastchangedat = lv_timestamp )

      ( client = sy-mandt uuid = lv_uuid_008 id = 'SO008'
        email = 'olivia.moore@gmail.com' firstname = 'Olivia' lastname = 'Moore'
        country = 'SPAIN' createdon = lv_today deliverydate = lv_today + 9
        orderstatus = 4 imageurl = 'https://img8.com'
        locallastchangedat = lv_timestamp )

      ( client = sy-mandt uuid = lv_uuid_009 id = 'SO009'
        email = 'lucas.martin@gmail.com' firstname = 'Lucas' lastname = 'Martin'
        country = 'FRANCE' createdon = lv_today deliverydate = lv_today + 1
        orderstatus = 2 imageurl = 'https://img9.com'
        locallastchangedat = lv_timestamp )

      ( client = sy-mandt uuid = lv_uuid_010 id = 'SO010'
        email = 'isabella.white@gmail.com' firstname = 'Isabella' lastname = 'White'
        country = 'GERMANY' createdon = lv_today deliverydate = lv_today + 10
        orderstatus = 1 imageurl = 'https://img10.com'
        locallastchangedat = lv_timestamp )

    ).

    lt_item = VALUE #(

      ( client = sy-mandt id = 'ITM001' salesorderuuid = lv_uuid_001 salesorderid = 'SO001'
        name = 'Laptop' description = 'Gaming Laptop'
        releasedate = lv_today discontinueddate = lv_today + 365
        price = '1500.00' height = '10.000' width = '35.000'
        depth = '25.00' quantity = '2.000' unitofmeasure = 'EA' )

      ( client = sy-mandt id = 'ITM002' salesorderuuid = lv_uuid_002 salesorderid = 'SO002'
        name = 'Mouse' description = 'Wireless Mouse'
        releasedate = lv_today discontinueddate = lv_today + 365
        price = '50.00' height = '5.000' width = '10.000'
        depth = '3.00' quantity = '5.000' unitofmeasure = 'EA' )

      ( client = sy-mandt id = 'ITM003' salesorderuuid = lv_uuid_003 salesorderid = 'SO003'
        name = 'Keyboard' description = 'Mechanical Keyboard'
        releasedate = lv_today discontinueddate = lv_today + 365
        price = '120.00' height = '4.000' width = '45.000'
        depth = '15.00' quantity = '3.000' unitofmeasure = 'EA' )

      ( client = sy-mandt id = 'ITM004' salesorderuuid = lv_uuid_004 salesorderid = 'SO004'
        name = 'Monitor' description = '4K Monitor'
        releasedate = lv_today discontinueddate = lv_today + 365
        price = '400.00' height = '50.000' width = '70.000'
        depth = '10.00' quantity = '1.000' unitofmeasure = 'EA' )

      ( client = sy-mandt id = 'ITM005' salesorderuuid = lv_uuid_005 salesorderid = 'SO005'
        name = 'Desk' description = 'Office Desk'
        releasedate = lv_today discontinueddate = lv_today + 365
        price = '250.00' height = '75.000' width = '120.000'
        depth = '60.00' quantity = '1.000' unitofmeasure = 'EA' )

      ( client = sy-mandt id = 'ITM006' salesorderuuid = lv_uuid_006 salesorderid = 'SO006'
        name = 'Chair' description = 'Gaming Chair'
        releasedate = lv_today discontinueddate = lv_today + 365
        price = '300.00' height = '120.000' width = '50.000'
        depth = '55.00' quantity = '2.000' unitofmeasure = 'EA' )

      ( client = sy-mandt id = 'ITM007' salesorderuuid = lv_uuid_007 salesorderid = 'SO007'
        name = 'Tablet' description = 'Android Tablet'
        releasedate = lv_today discontinueddate = lv_today + 365
        price = '600.00' height = '8.000' width = '20.000'
        depth = '1.00' quantity = '4.000' unitofmeasure = 'EA' )

      ( client = sy-mandt id = 'ITM008' salesorderuuid = lv_uuid_008 salesorderid = 'SO008'
        name = 'Phone' description = 'Smartphone'
        releasedate = lv_today discontinueddate = lv_today + 365
        price = '900.00' height = '15.000' width = '7.000'
        depth = '1.00' quantity = '6.000' unitofmeasure = 'EA' )

      ( client = sy-mandt id = 'ITM009' salesorderuuid = lv_uuid_009 salesorderid = 'SO009'
        name = 'Printer' description = 'Laser Printer'
        releasedate = lv_today discontinueddate = lv_today + 365
        price = '350.00' height = '40.000' width = '45.000'
        depth = '30.00' quantity = '1.000' unitofmeasure = 'EA' )

      ( client = sy-mandt id = 'ITM010' salesorderuuid = lv_uuid_010 salesorderid = 'SO010'
        name = 'Camera' description = 'Digital Camera'
        releasedate = lv_today discontinueddate = lv_today + 365
        price = '1100.00' height = '12.000' width = '14.000'
        depth = '8.00' quantity = '2.000' unitofmeasure = 'EA' )

    ).

    INSERT zso_hdr_4112 FROM TABLE @lt_header.
    INSERT zso_itm_4112 FROM TABLE @lt_item.

    COMMIT WORK.

    out->write( 'Random Sales Orders inserted successfully' ).

  ENDMETHOD.

ENDCLASS.
