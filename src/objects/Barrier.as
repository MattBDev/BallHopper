
package objects {
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class Barrier extends Sprite {
    public function Barrier() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

    }
    public var barrier:Image;
    private var speed:Number = Math.max(.4, Math.random());

    public function drawBarrier():void {
        this.x = Math.random() * stage.stageWidth;
        barrier = new Image(Texture.fromColor(20, 20, 0xFF7FFFD4));
        this.height = 20;
        this.width = 20;
        while (barrier.bounds.left < 0 || barrier.bounds.right > stage.stageWidth) {
            this.x = Math.random() * stage.stageWidth;
        }
        this.addChild(barrier);
    }

    private function onAddedToStage(event:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.addEventListener(Event.ENTER_FRAME, update);
        drawBarrier();
    }

    private function update(event:Event):void {
        this.y += speed;
    }

}
}
