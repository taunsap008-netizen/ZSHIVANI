CLASS zsh_test1_fill_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  methods flush.
  methods fill_mater_data.
  methods fill_transaction_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsh_test1_fill_data IMPLEMENTATION.
METHOD flush.
DELETE FROM: zsh_test1_bp, zsh_test1_produc, zsh_test1_so,zsh_test1_so_i.
ENDMETHOD.

METHOD fill_mater_data.
DATA: lt_bp TYPE TABLE of zsh_test1_bp,
      lt_prod TYPE table of zsh_test1_produc.

      APPEND VALUE #( bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
      bp_role = '01'
      company_name = 'TCS'
      city = 'Delhi'
      street = 'Ameerpeeth'
      country = 'IN'
      region = 'SI'

      ) to lt_bp.

      APPEND VALUE #( bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
      bp_role = '02'
      company_name = 'Infosys'
      city = 'Mumbai'
      street = 'Navi Mumbai'
      country = 'IN'
      region = 'MM'

      ) to lt_bp.

      APPEND VALUE #( prod_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
      bp_role = '01'
      name = 'HP Laptop'
      category = 'HP'
      price = 250
      currency = 'INR'
      discount = 2

      ) to lt_prod.

            APPEND VALUE #( prod_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
      bp_role = '02'
      name = 'Dell Laptop'
      category = 'Dell'
      price = 980
      currency = 'EUD'
      discount = 10

      ) to lt_prod.

      insert zsh_test1_bp FROM TABLE @lt_bp.
      INSERT zsh_test1_produc FROM TABLE @lt_prod.

ENDMETHOD.

METHOD fill_transaction_data.

DATA: o_rand TYPe ref to cl_abap_random_int,
      n TYPE i,
      lt_so TYPE TABLE of zsh_test1_so,
      lt_so_i TYPE table of zsh_test1_so_i,
      seed TYPE i.

      seed = cl_abap_random=>seed( ).
      cl_abap_random_int=>create(
        EXPORTING
          seed = seed
          min  = 1
          max  = 2
        RECEIVING
          prng = o_rand
      ).
*      CATCH cx_abap_random.

SELECT * from zsh_test1_bp into table @DATA(lt_bp).
SELECT * from zsh_test1_produc into TABLE @DATA(lt_prod).

do 10 TIMES.
DATA(lv_ord_id) = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( ).

n = o_rand->get_next( ).
READ TABLE lt_bp into DATA(ls_bp) INDEX n.
APPEND VALUE #(
order_id = lv_ord_id
order_no = sy-index
buyer = ls_bp-bp_id
gross_amount = n * 100
currency = 'INR'

) TO lt_so.

do 2 TIMES.
READ TABLE lt_prod into DATA(ls_prod) INDEX n.
APPEND VALUE #(
item_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
order_id = lv_ord_id
  product = ls_prod-prod_id
  qty = n
  uom = 'PC'
  amount    = n * ls_prod-price
  currency   = 'INR'
) to lt_so_i.

ENDDO.
ENDDO.
INSERT zsh_test1_so FROM TABLE @lt_so.
INSERT zsh_test1_so_i FROM TABLE @lt_so_i.
ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
me->flush( ).
me->fill_mater_data( ).
me->fill_transaction_data( ).


  ENDMETHOD.

ENDCLASS.
