sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/ust/somonitoring/test/integration/pages/SalesOrderApprovalList",
	"com/ust/somonitoring/test/integration/pages/SalesOrderApprovalObjectPage"
], function (JourneyRunner, SalesOrderApprovalList, SalesOrderApprovalObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/ust/somonitoring') + '/test/flp.html#app-preview',
        pages: {
			onTheSalesOrderApprovalList: SalesOrderApprovalList,
			onTheSalesOrderApprovalObjectPage: SalesOrderApprovalObjectPage
        },
        async: true
    });

    return runner;
});

