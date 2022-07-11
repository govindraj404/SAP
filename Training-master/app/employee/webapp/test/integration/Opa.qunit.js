sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'demo/employee/test/integration/pages/MainListReport' ,
        'demo/employee/test/integration/pages/MainObjectPage',
        'demo/employee/test/integration/OpaJourney'
    ],
    function(JourneyRunner, MainListReport, MainObjectPage, Journey) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('demo/employee') + '/index.html'
        });

        
        JourneyRunner.run(
            {
                pages: { onTheMainPage: MainListReport, onTheDetailPage: MainObjectPage }
            },
            Journey.run
        );
        
    }
);