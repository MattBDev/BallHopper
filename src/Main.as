package {

import flash.display.Sprite;
import flash.events.Event;
import flash.utils.getTimer;

import starling.core.Starling;

[SWF(width="400",height="300",frameRate="60",backgroundColor="#FFDC00")]
public class Main extends Sprite {
    public static var time:Number = getTimer();

    public function Main()
    {
        if (stage)
        {
            init();
        }
        else
        {
            addEventListener(Event.ADDED_TO_STAGE, init);
        }
    }

    private var mStarling:Starling;

    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        // Create a Starling instance that will run the "Game" class
        trace(stage.stageHeight + "x" + stage.stageWidth);
        trace(stage.height + "x" + stage.width);
        mStarling = new Starling(Game, stage);
        trace(mStarling.stage.stageHeight + "x" + mStarling.stage.stageWidth);
        trace(mStarling.stage.height + "x" + mStarling.stage.width);
        mStarling.start();

    }

}
}
