package events 

{
	import flash.events.Event;
	public class SimpleEvent extends Event
	{
		public static const SIMPLE_EVENT:String = "Simple_event";
		public var data:*;
		
		public function SimpleEvent(type:String, param:*){
			super(SIMPLE_EVENT, true, true);

			this.data = param;
		}
	}
}



