using ZAPI_SALES_ORDER_SRV from './external/ZAPI_SALES_ORDER_SRV.cds';

service ZAPI_SALES_ORDER_SRVSampleService {
    @readonly
    entity A_SalesOrder as projection on ZAPI_SALES_ORDER_SRV.A_SalesOrder
    {        key SalesOrder, SalesOrderType, SalesOrganization, DistributionChannel, OrganizationDivision, SalesGroup, SalesOffice, SalesDistrict, SoldToParty, CreationDate, CreatedByUser
    }    
;
}