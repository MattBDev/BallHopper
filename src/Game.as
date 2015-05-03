package {
import events.NavigationEvent;

import screens.HelpScreen;
import screens.InGame;
import screens.Welcome;

import starling.display.Sprite;
import starling.events.Event;

public class Game extends Sprite {
    public function Game() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }
    private var screenWelcome:Welcome;
    private var screenInGame:InGame;
    private var helpScreen:HelpScreen;

    private function onAddedToStage(e:Event):void {
        this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
        trace("game screen init");
        helpScreen = new HelpScreen();
        helpScreen.disposeTemporarily();
        this.addChild(helpScreen);
        screenInGame = new InGame();
        screenInGame.disposeTemporarily();
        this.addChild(screenInGame);
        screenWelcome = new Welcome();
        this.addChild(screenWelcome);
        screenWelcome.initialize();
    }

    private function onChangeScreen(event:NavigationEvent):void {
        switch (event.params.id) {
            case "play":
                helpScreen.disposeTemporarily();
                screenWelcome.disposeTemporarily();
                helpScreen.removeEventListeners();
                screenInGame.initialize();
                screenWelcome.removeEventListeners();
                break;
                break;
            case "help":
                screenWelcome.disposeTemporarily();
                screenWelcome.removeEventListeners();
                helpScreen.initialize();
            default:
        }
    }
}
}