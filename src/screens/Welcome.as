package screens {
import events.NavigationEvent;

import starling.display.Button;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

/**
 * ...
 * @author Matthew Bonanno
 */
public class Welcome extends Sprite {
    public function Welcome() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private var play:Button;
    private var help:Button;

    public function initialize():void {
        this.visible = true;
        this.addEventListener(Event.TRIGGERED, onMainMenuClicked);
    }

    public function disposeTemporarily():void {
        this.visible = false;
        this.removeEventListener(Event.TRIGGERED, onMainMenuClicked);
    }

    private function drawScreen():void {
        this.width = stage.stageWidth;
        this.height = stage.stageHeight;
        var width:int = 100;
        var height:int = 100;
        spawnPlayButton(width, height);
        spawnHelpButton(width, height);
        initialize();
    }

    private function spawnHelpButton(width:int, height:int):void {
        help = new Button(Texture.fromColor(width, height, 0xFF800080), "Help");
        help.fontSize = 16;
        help.fontBold = true;
        help.height = height;
        help.width = width;
        help.x = stage.stageWidth / 4;
        help.y = (stage.stageHeight / 4);
        this.addChild(help);
    }

    private function spawnPlayButton(width:int, height:int):void {
        play = new Button(Texture.fromColor(width, height, 0xFF2ECC40), "Play Game");
        play.fontSize = 16;
        play.fontBold = true;
        play.height = height;
        play.width = width;
        play.x = stage.stageWidth / 2;
        play.y = stage.stageHeight / 2;
        this.addChild(play);

    }

    private function onAddedToStage(e:Event):void {
        trace("welcome screen init");
        drawScreen();
    }

    private function onMainMenuClicked(e:Event):void {
        trace("main menu clicked");
        var buttonClicked:Button = e.target as Button;
        if (buttonClicked == play) {
            trace("play clicked");
            this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
        }
        if (buttonClicked == help) {
            trace("help clicked");
            this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "help"}, true));
        }
    }

}

}