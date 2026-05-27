CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS validateEmail FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateEmail.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateDates.

    METHODS setDefaultID FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Header~setDefaultID.


ENDCLASS.


CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validateEmail.

    READ ENTITIES OF zi_so_header_4112 IN LOCAL MODE
      ENTITY Header
      FIELDS ( Email )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_header).

    LOOP AT lt_header INTO DATA(ls_header).
      IF ls_header-Email IS INITIAL OR ls_header-Email NS '@'.
        APPEND VALUE #( %tky = ls_header-%tky ) TO failed-header.

        APPEND VALUE #(
          %tky = ls_header-%tky
          %msg = new_message(
            id       = 'ZSO_MSG_4112'
            number   = '001'
            severity = if_abap_behv_message=>severity-error
            v1       = 'Email inválido'
          )
          %element-Email = if_abap_behv=>mk-on
        ) TO reported-header.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD validateDates.

    READ ENTITIES OF zi_so_header_4112 IN LOCAL MODE
      ENTITY Header
      FIELDS ( CreatedOn DeliveryDate )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_header).

    LOOP AT lt_header INTO DATA(ls_header).
      IF ls_header-DeliveryDate < ls_header-CreatedOn.
        APPEND VALUE #( %tky = ls_header-%tky ) TO failed-header.

        APPEND VALUE #(
          %tky = ls_header-%tky
          %msg = new_message(
            id       = 'ZSO_MSG_4112'
            number   = '002'
            severity = if_abap_behv_message=>severity-error
            v1       = 'DeliveryDate no puede ser menor a CreatedOn'
          )
          %element-DeliveryDate = if_abap_behv=>mk-on
        ) TO reported-header.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD setDefaultID.

    SELECT id
      FROM zso_hdr_4112
      WHERE id LIKE 'SO%'
      ORDER BY id DESCENDING
      INTO @DATA(lv_max_id)
      UP TO 1 ROWS.
    ENDSELECT.

    DATA(lv_next) = 1.

    IF lv_max_id IS NOT INITIAL.
      DATA(lv_num) = lv_max_id+2(3).
      lv_next = CONV i( lv_num ) + 1.
    ENDIF.

    MODIFY ENTITIES OF zi_so_header_4112 IN LOCAL MODE
      ENTITY Header
      UPDATE FIELDS ( Id )
      WITH VALUE #(
        FOR key IN keys
        (
          %tky = key-%tky
          Id = |SO{ lv_next WIDTH = 3 ALIGN = RIGHT PAD = '0' }|
        )
      ).

  ENDMETHOD.


ENDCLASS.


CLASS lhc_Item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS validateQuantity FOR VALIDATE ON SAVE
      IMPORTING keys FOR Item~validateQuantity.

ENDCLASS.


CLASS lhc_Item IMPLEMENTATION.

  METHOD validateQuantity.

    READ ENTITIES OF zi_so_header_4112 IN LOCAL MODE
      ENTITY Item
      FIELDS ( Quantity )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_item).

    LOOP AT lt_item INTO DATA(ls_item).
      IF ls_item-Quantity <= 0.
        APPEND VALUE #( %tky = ls_item-%tky ) TO failed-item.

        APPEND VALUE #(
          %tky = ls_item-%tky
          %msg = new_message(
            id       = 'ZSO_MSG_4112'
            number   = '003'
            severity = if_abap_behv_message=>severity-error
            v1       = 'Quantity debe ser mayor a 0'
          )
          %element-Quantity = if_abap_behv=>mk-on
        ) TO reported-item.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
