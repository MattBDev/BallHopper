/**
 * Created by Matthew on 5/2/2015.
 */
package screens {
import events.NavigationEvent;

import starling.display.Button;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;

public class HelpScreen extends Sprite {
    public function HelpScreen() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private var play:Button;

    public function initialize():void {
        this.visible = true;
    }

    public function disposeTemporarily():void {
        this.visible = false;
    }

    private function drawScreen():void {
        this.width = stage.stageWidth;
        this.height = stage.stageHeight;
        var width:int = 100;
        var height:int = 100;
        spawnPlayButton(width, height);
        var textField:TextField = new TextField(300, 100, "Use A to move left and D to move right. don't hit the falling blocks.");
        textField.autoScale = true;
        textField.x = stage.stageWidth / 5;
        textField.y = stage.stageHeight / 8;
        this.addChild(textField);
        this.addEventListener(Event.TRIGGERED, onMainMenuClicked);
    }

    private function spawnPlayButton(width:int, height:int):void {
        play = new Button(Texture.fromColor(width, height, 0xFF2ECC40), "Play Game");
        play.fontSize = 16;
        play.fontBold = true;
        play.height = height;
        play.width = width;
        play.x = stage.stageWidth / 3;
        play.y = stage.stageHeight / 3;
        this.addChild(play);

    }

    private function onAddedToStage(e:Event):void {
        trace("welcome screen init");
        drawScreen();
    }

    private function onMainMenuClicked(e:Event):void {
        var buttonClicked:Button = e.target as Button;
        this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
    }
}
}
