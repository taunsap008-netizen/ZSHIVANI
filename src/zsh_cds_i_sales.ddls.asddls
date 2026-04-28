@AbapCatalog.sqlViewName: 'ZSH_SQL_I_SALES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assoc on sales table'
@Metadata.ignorePropagatedAnnotations: true
define view zsh_cds_i_sales as select from zsh_test1_so_i
association[1] to zsh_test1_so as _saleshdr
on $projection.OrderId = _saleshdr.order_id
{
    key item_id as ItemId,
    order_id as OrderId,
    product as Product,
    qty as Qty,
    uom as Uom,
    amount as Amount,
    currency as Currency,
    created_by as CreatedBy,
    created_on as CreatedOn,
    changed_by as ChangedBy,
    changed_on as ChangedOn,
    _saleshdr
}
