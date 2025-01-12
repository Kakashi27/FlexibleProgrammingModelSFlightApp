sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/flex/travel/sflightflexapp/test/integration/FirstJourney',
		'com/flex/travel/sflightflexapp/test/integration/pages/TravelMain'
    ],
    function(JourneyRunner, opaJourney, TravelMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/flex/travel/sflightflexapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTravelMain: TravelMain
                }
            },
            opaJourney.run
        );
    }
);