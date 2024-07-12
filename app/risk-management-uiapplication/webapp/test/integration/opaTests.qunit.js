sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'riskmanagementuiapplication/test/integration/FirstJourney',
		'riskmanagementuiapplication/test/integration/pages/RisksList',
		'riskmanagementuiapplication/test/integration/pages/RisksObjectPage'
    ],
    function(JourneyRunner, opaJourney, RisksList, RisksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('riskmanagementuiapplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRisksList: RisksList,
					onTheRisksObjectPage: RisksObjectPage
                }
            },
            opaJourney.run
        );
    }
);