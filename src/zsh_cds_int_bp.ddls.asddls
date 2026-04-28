@AbapCatalog.sqlViewName: 'ZSH_SQL_I_BP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BP table'
@Metadata.ignorePropagatedAnnotations: true
define view zsh_cds_int_bp as select from zsh_test1_bp
{
    key bp_id as BpId,
    bp_role as BpRole,
    company_name as CompanyName,
    street as Street,
    city as City,
    country as Country,
    region as Region
}
