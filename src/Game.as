package
{
import events.NavigationEvent;

import screens.InGame;
import screens.Welcome;

import starling.display.Sprite;
import starling.events.Event;

public class Game extends Sprite
{
    private var screenWelcome:Welcome;
    private var screenInGame:InGame;
    public function Game()
    {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(e:Event):void
    {
        this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
        trace("game screen init");
        screenInGame = new InGame();
        screenInGame.disposeTemporarily();
        this.addChild(screenInGame);
        screenWelcome = new Welcome();
        this.addChild(screenWelcome);
        screenWelcome.initialize();
    }
    private function onChangeScreen(event:NavigationEvent):void {
        switch (event.params.id)
        {
            case "play":
                screenWelcome.disposeTemporarily();
                screenInGame.initialize();
                break;
                break;
            default:
        }
    }
}
}