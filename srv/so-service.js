const cds = require('@sap/cds');
const { UPDATE, SELECT } = require('@sap/cds/lib/ql/cds-ql');

module.exports = cds.service.impl(function () {
    const { SalesOrderApproval } = this.entities;
    
    this.on('approveSalesOrder', async (req) => {
        const { ID } = req.params[0];

        const query = await SELECT.one.from(SalesOrderApproval).where({ ID })

        if (query.netValue > 100000) {
            await UPDATE(SalesOrderApproval)
                .set({ approvalStatus: 'Approved' })
                .where({ ID });
        }
        if (query.netValue <= 100000) {
            req.error('Sales order value must be greater than 100,000 to be approved.')
        }
        return { ID, approvalStatus: 'Approved' }
    });
    this.on('rejectSalesOrder', async (req) => {
        const { ID } = req.params[0];

        const query = await SELECT.one.from(SalesOrderApproval).where({ ID })
        if (query.netValue <= 100000) {
            req.error('Sales order value must be greater than 100,000 to be Rejected.')
        }
        if (query.netValue > 100000 && query.approvalStatus !== 'Approved') {
            await UPDATE(SalesOrderApproval)
                .set({ approvalStatus: 'Rejected' })
                .where({ ID });
        }

        return { ID, approvalStatus: 'Rejected' }
    });
    // this.on('Read','SalesOrderApproval',async (req) => {

    //     if(req.params && req.params.length > 0){
    //         const sid = req.params[0].ID
    //         const query = await SELECT.from(SalesOrderApproval).where({ID:sid})

    //         if(!query || !query.ID){
    //             return [];
    //         }
    //     }
    // }
    this.on('READ', 'Configuration', req => {
    return {
      ID: '1',
      isManager: req.user.is('SO_Manager')
    };
  });

    
});