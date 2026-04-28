@AbapCatalog.sqlViewName: 'ZSH_SQL_SALESHDR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Header'
@Metadata.ignorePropagatedAnnotations: true
define view zsh_cds_i_saleshdr as select from zsh_test1_so 
association[1] to zsh_test1_bp as _BP
on $projection.buyer = _BP.bp_id
{
    key order_id,
    order_no,
    buyer ,
    gross_amount,
    currency,
    _BP
}
