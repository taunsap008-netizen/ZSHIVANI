@AbapCatalog.sqlViewName: 'ZSHSQLSALESN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales'
@Metadata.ignorePropagatedAnnotations: true
define view zsh_cds_i_sales_n as select from zsh_cds_i_sales
association[1] to zsh_cds_p_prod as _prod
on $projection.Product = _prod.ProdId

association[1] to zsh_cds_i_saleshdr as _saleshdr 
on $projection.OrderId = _saleshdr.order_id

{     
    key ItemId,
    OrderId,
    Product,
    Qty,
    Uom,
    Amount,
    Currency,
    _saleshdr.order_no,
    _saleshdr._BP.company_name as company,
    _saleshdr._BP.country as country,
    _saleshdr._BP.region as resgion,
    _prod.Name as Productname,
    _prod.Category as category
    
}
