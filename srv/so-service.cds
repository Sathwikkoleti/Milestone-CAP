using {SOMonitoring.db} from '../db/schema';
using {ZAPI_SALES_ORDER_SRVSampleService} from './ZAPI_SALES_ORDER_SRV';

service MyService {
    @require: [{grant:'*',to: 'SO_Manager'},
    {grant: 'Read', to: 'SO_Employee'}]
    entity SalesOrderApproval as
        projection on db.SalesOrderApproval {
            *,
            to_SalesOrder : Association to  A_SalesOrder on to_SalesOrder.SalesOrder = SalesOrderId
        }
        actions {
            @Common.SideEffects: {TargetProperties: ['approvalStatus']}
            @require: [{grant:'*',to: 'SO_Manager'}]
            action approveSalesOrder() returns SalesOrderApproval;
            @require: [{grant:'*',to: 'SO_Manager'}]
            action rejectSalesOrder()  returns SalesOrderApproval
        };

    entity A_SalesOrder       as
        projection on ZAPI_SALES_ORDER_SRVSampleService.A_SalesOrder;

    @odata.singleton @cds.persistence.skip
    entity Configuration {
        key ID: String;
        isAdmin : Boolean;
    }

}
