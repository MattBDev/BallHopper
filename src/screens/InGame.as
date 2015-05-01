package screens {
import flash.utils.getTimer;

import objects.Ball;
import objects.Barrier;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class InGame extends Sprite {
    private var barriers:Vector.<Barrier> = new Vector.<Barrier>();

    private var ball:Ball;

    public function InGame() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        trace("init");
    }

    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.addEventListener(Event.ENTER_FRAME, update);
        drawGame();
    }

    private function update(event:Event):void {
        if (ball != null) {
            var number2:int = (Math.round(Main.time) * 100000) % Math.round(getTimer());
            if (number2 && barriers.length < 6) {
                spawnBarrier();
            }
            interactCheck();
        }
    }

    private function spawnBarrier():void {
        if(barriers.length < 6) {
            var barrier:Barrier = new Barrier();
            this.addChild(barrier);
            for (var i:int = 0; i < barriers.length; i++) {
                while((barriers[i].bounds.intersects(barrier.bounds))) {
                    barriers[i].move();
                }
            }
            barriers.push(barrier);
        }
    }

    private function interactCheck():void {
        for (var i:int = 0; i < barriers.length; i++) {
            trace("ball left:"+ball.bounds.left);
            trace("barrier right:" + barriers[i].bounds.right);
            if (ball.bounds.left == barriers[i].bounds.right) {
                if(ball.bounds.top == barriers[i].bounds.bottom || ball.bounds.bottom == barriers[i].bounds.top) {
                    ball.leftEnabled = false;
                    ball.leftPressed = false;
                    break;
                }
            } else {
                ball.leftEnabled = true;
            }
            if (ball.bounds.right == barriers[i].bounds.left){
                ball.rightPressed = false;
                ball.rightEnabled = false;
                break;
            } else {
                ball.rightEnabled = true;
            }
        }
    }

    private function drawGame():void {
        var bg:Image = new Image(Texture.fromColor(400, 300, 0xFFFF5434));
        this.addChild(bg);

    }

    public function disposeTemporarily():void {
        this.visible = false;
    }

    public function initialize():void {
        this.visible = true;
        ball = new Ball();
        ball.x = stage.stageWidth / 2;
        ball.y = stage.stageHeight / 2;
        this.addChild(ball);
    }
}
}