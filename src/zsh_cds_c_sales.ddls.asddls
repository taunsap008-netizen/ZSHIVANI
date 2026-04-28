@AbapCatalog.sqlViewName: 'ZSHSQLCSALESN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales'
@Metadata.ignorePropagatedAnnotations: true
define view zsh_cds_c_sales as select from zsh_cds_i_sales_n
{
    key category,
    sum(Amount) as totalsales,
    Currency   
}
group by category, Currency






