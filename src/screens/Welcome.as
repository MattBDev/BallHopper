package screens {
import events.NavigationEvent;

import starling.display.Button;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

/**
 * ...
 * @author Matthew Bonanno
 */
public class Welcome extends Sprite {
    private var play:Button;

    public function Welcome() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

    }

    private function onAddedToStage(e:Event):void {
        trace("welcome screen init");
        drawScreen();
    }

    private function drawScreen():void {
        var width:int = 100;
        var height:int = 100;
        play = new Button(Texture.fromColor(width,height, 0xFF2ECC40),"Play Game");
        play.fontSize = 16;
        play.fontBold = true;
        play.height = height;
        play.width = width;
        play.x = stage.stageWidth / 2;
        play.y = stage.stageHeight / 2;
        this.addChild(play);
        this.addEventListener(Event.TRIGGERED, onMainMenuClicked);
    }

    private function onMainMenuClicked(e:Event):void {
        trace("main menu clicked");
        var buttonClicked:Button = e.target as Button;
        if (buttonClicked == play) {
            trace("play clicked");
            this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
        }
    }

    public function initialize():void {
        this.visible = true;
    }

    public function disposeTemporarily():void {
        this.visible = false;
    }

}

}