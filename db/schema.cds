namespace SOMonitoring.db;
using { managed,Currency } from '@sap/cds/common';

type ApprovalStatus : String enum  { Pending;
 Approved;
 Rejected;
 }

entity SalesOrderApproval:managed{
    key ID: UUID;
    SalesOrderId: UUID;
    SalesOrg : String;
    SoldToParty: String;
    netValue: Decimal(10,2);
    currency : Currency;
    approverComment : String;
    approvalStatus : ApprovalStatus default 'Pending';
}

