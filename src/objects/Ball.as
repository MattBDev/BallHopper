package objects {
import flash.ui.Keyboard;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.textures.Texture;

public class Ball extends Sprite {

    public var yVelocity:Number = -0.5;
    public var xVelocity:Number = 0; // these will be assigned when the ball is shot
    public var grav:Number = 0;
    public var leftPressed:Boolean;
    public var rightPressed:Boolean;
    public var spacePressed:Boolean;
    public var move:Boolean = true;
    public var rightEnabled:Boolean;
    public var leftEnabled:Boolean;
    // Number, not "int"

    public function Ball() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
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
            if (event.keyCode == Keyboard.SPACE) {
                spacePressed = false;
                trace("HELP ME");
            }
        }
        if (event.type == KeyboardEvent.KEY_DOWN) {
            if (event.keyCode == Keyboard.A) {
                leftPressed = true;
                rightPressed = false;
            }
            if (event.keyCode == Keyboard.D) {
                rightPressed = true;
                leftPressed = false;
            }
            if (event.keyCode == Keyboard.SPACE) {
                spacePressed = true;
                trace("HELP");
            }

        }
    }

    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        drawBall();
    }

    private function update(e:Event):void {
        gravity();
        horizontalControl();
    }

    private function horizontalControl():void {
        if (!(this.bounds.left < 0)) {
            this.x--;
        }
        if (!(this.bounds.right > stage.stageWidth)) {
            this.x++;
        }
        if (spacePressed) {
            this.y = this.y + (yVelocity + -0.1);
            trace("HELP ME");

        }
    }

    private function gravity():void {
        if (this.bounds.bottom > stage.stageHeight) {
            move = false;
        }
        if (move) {
            if (!spacePressed) {
                this.y -= this.yVelocity;
            }
        }
    }

    private function drawBall():void {
        var ballart:Image = new Image(Texture.fromColor(20, 20, 0xFF001f3f));
        this.width = ballart.width = this.height = ballart.height = 20;
        this.addChild(ballart);
    }
}
}