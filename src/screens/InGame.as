package screens {
import flash.geom.Point;

import objects.Ball;
import objects.Barrier;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class InGame extends Sprite {
    public function InGame() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        trace("init");
    }

    private var ball:Ball = new Ball();
    private var maxBarrier:int = 1;

    private var _barrierTable:Array = [];

    public function get barrierTable():Array {
        return _barrierTable;
    }

    public function disposeTemporarily():void {
        this.visible = false;
        this.removeEventListeners(Event.ENTER_FRAME);
    }

    public function initialize():void {
        this.visible = true;
        ball.x = stage.stageWidth / 2;
        ball.y = stage.stageHeight / 2;
        this.addChild(ball);
        this.addEventListener(Event.ENTER_FRAME, update);
    }

    private function spawnBarrier():void {
        if (Math.random() && _barrierTable.length < maxBarrier) {
            var barrier:Barrier = new Barrier();
            this.addChild(barrier);
            //add a touch event to each enemy
            barrier.addEventListener(Event.ENTER_FRAME, despawnBarrier);
            //add the enemy to the enemyTable
            _barrierTable.push(barrier);
        }
    }

    private function drawGame():void {
        var bg:Image = new Image(Texture.fromColor(400, 300, 0xFFFF5434));
        this.addChild(bg);

    }

    private function onAddedToStage(event:Event):void {
        drawGame();
    }

    private function update(event:Event):void {
        if (Math.random() > .9) {
            spawnBarrier();
        }
    }

    private function despawnBarrier(event:Event):void {
        var barrier:Barrier = event.currentTarget as Barrier;
        var distance:Number = Point.distance(barrier.bounds.topLeft, ball.bounds.topLeft);
        var radius1:Number = barrier.width / 2;
        var radius2:Number = ball.width / 2;
        if (barrier.bounds.bottom > stage.stageHeight) {
            for (var i:int = 0; i < _barrierTable.length; i++) {
                //find the item in the table that is the same as the enemy
                if (_barrierTable[i] == barrier) {
                    maxBarrier++;
                    //remove the enemy from the table
                    _barrierTable.splice(i, 1);
                    //remove the enemy
                    this.removeChild(barrier);
                    barrier.removeEventListeners();
                    barrier.dispose();
                    //break out of the loop
                    break;
                }
            }
        } else if (distance < radius1 + radius2) {
            for (var i:int = 0; i < _barrierTable.length; i++) {
                //find the item in the table that is the same as the enemy
                if (_barrierTable[i] == barrier) {
                    //remove the enemy from the table
                    _barrierTable.splice(i, 1);
                    if (maxBarrier != 1) maxBarrier--;
                    //remove the enemy
                    barrier.removeEventListeners();
                    this.removeChild(barrier);
                    barrier.dispose();
                    //break out of the loop
                    break;
                }
            }
        }

    }
}
}