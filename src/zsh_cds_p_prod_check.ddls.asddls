@AbapCatalog.sqlViewName: 'ZSH_SQL_P_PRODC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product table'
@Metadata.ignorePropagatedAnnotations: true
define view ZSH_CDS_P_Prod_check as select from zsh_test1_produc
{
    key prod_id as ProdId,
    bp_role as BpRole,
    name as Name,
    category as Category,
    price as Price,
    currency as Currency,
    discount as Discount
}
