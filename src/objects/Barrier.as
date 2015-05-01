
package objects {
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class Barrier extends Sprite {
    public var barrier:Image;
    public function Barrier() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

    }

    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        drawBarrier();
    }

    private function drawBarrier():void {
        var width:int = Math.random() * 80;
        var height:int = 20;
        while (width < 40) {
            width = Math.random() * 80;
        }
        barrier = new Image(Texture.fromColor(width, height, 0xF5031f3f, true));
        this.width = width;
        this.height = height;
        this.addChild(barrier);
        move();
    }
    public function move():void {
        var checkX:int = Math.random() * stage.stageWidth;
        this.x = checkX;
        while(this.bounds.left < 0 || this.bounds.right > stage.stageWidth) {
            checkX = Math.random()* stage.stageWidth;
            this.x = checkX;
        }
        var checkY:Number = Math.random() * stage.stageHeight;
        this.y = checkY;
        while(this.bounds.top < 0 || this.bounds.bottom > stage.stageHeight) {
            checkY = Math.random() * stage.stageHeight;
            this.y = checkY;
        }
    }
}
}
