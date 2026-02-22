import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class MetronomeApp extends Application.AppBase {

    var controller;
    var userStarted = false;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        //controller.startMetronome();
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
        controller.stopMetronome();
        controller.saveBpm();
    }

    function getController() as MetronomeController {
        if (controller == null) {
            controller = new $.MetronomeController();
        }
        return controller;
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        userStarted = true;
        return [ new MetronomeView(), new MetronomeDelegate() ];
    }

    function getGlanceView() {
        return [new MetronomeGlanceView()];
    }
}

function getApp() as MetronomeApp {
    return Application.getApp() as MetronomeApp;
}