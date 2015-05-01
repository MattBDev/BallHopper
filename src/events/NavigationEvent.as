package events
{
	import starling.events.Event;
	
	public class NavigationEvent extends Event
	{
		public static const CHANGE_SCREEN:String = "changeScreen";
		
		public var params:Object;
		
		public function NavigationEvent(type:String, _params:Object = null, bubbles:Boolean=false)
		{
			super(type, bubbles);
			trace("nav event");
			this.params = _params;
		}
	}
}