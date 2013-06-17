package com.digitalfun.pingback
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.external.ExtensionContext;
	
	public class PingBack extends EventDispatcher
	{
		
		public var extContext:ExtensionContext;
		
		public function PingBack()
		{
			super(null);
			
			extContext = ExtensionContext.createExtensionContext( "com.digitalfun.pingback", "" );
			if ( !extContext ) {
				throw new Error( "PingBack extension is not supported on this platform." );
			}
		}
		
		public function publishInstall(appid:String):void {
			extContext.call("publishInstall",appid);
		}
	}
}