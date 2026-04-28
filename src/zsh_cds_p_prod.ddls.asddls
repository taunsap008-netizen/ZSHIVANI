@AbapCatalog.sqlViewName: 'ZSH_SQL_P_PROD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product table'
@Metadata.ignorePropagatedAnnotations: true
define view zsh_cds_p_prod as select from zsh_test1_produc
{
    key prod_id as ProdId,
    bp_role as BpRole,
    name as Name,
    category as Category,
    price as Price,
    currency as Currency,
    discount as Discount
}
