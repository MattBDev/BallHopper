package objects {
import flash.ui.Keyboard;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.textures.Texture;

public class Ball extends Sprite {
    public function Ball() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }
    public var leftPressed:Boolean;
    public var rightPressed:Boolean;
    public var spacePressed:Boolean;
    public var move:Boolean = true;

    private function horizontalControl():void {
        if (rightPressed) {
            if (!(this.bounds.right >= stage.stageWidth)) {
                this.x += 1.5;
            }
        }
        if (leftPressed) {
            if (!(this.bounds.left <= 0)) {
                this.x -= 1.5;
            }
        }
    }

    private function drawBall():void {
        var ballart:Image = new Image(Texture.fromColor(20, 20, 0xFF001f3f));
        this.width = ballart.width = this.height = ballart.height = 20;
        this.addChild(ballart);
        this.addEventListener(Event.ENTER_FRAME, update);
        this.addEventListener(KeyboardEvent.KEY_DOWN, keyboard);
        this.addEventListener(KeyboardEvent.KEY_UP, keyboard);

    }

    private function keyboard(event:KeyboardEvent):void {
        if (event.type == KeyboardEvent.KEY_UP) {
            if (event.keyCode == Keyboard.A) {
                leftPressed = false;
            }
            if (event.keyCode == Keyboard.D) {
                rightPressed = false;
            }
//            if (event.keyCode == Keyboard.SPACE) {
//                spacePressed = false;
//            }
        }
        if (event.type == KeyboardEvent.KEY_DOWN) {
            if (event.keyCode == Keyboard.A) {
                leftPressed = true;
            }
            if (event.keyCode == Keyboard.D) {
                rightPressed = true;
            }
//            if (event.keyCode == Keyboard.SPACE) {
//                spacePressed = true;
//            }

        }
    }

    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        drawBall();
    }

    private function update(e:Event):void {
        horizontalControl();
    }
}
}