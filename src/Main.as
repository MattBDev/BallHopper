package {

import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.utils.getTimer;

import starling.core.Starling;

[SWF(width="400",height="300",frameRate="60",backgroundColor="#FFDC00")]
public class Main extends Sprite {
    private var mStarling:Starling;
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

    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
        // Create a Starling instance that will run the "Game" class
        mStarling = new Starling(Game, stage);
        mStarling.start();

    }

}
}
