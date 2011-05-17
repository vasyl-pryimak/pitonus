package Utils
{
	import Elements.Canvas;
	import Utils.*;
	
    public function getActiveElementsRecursive( canvas : Canvas, d : uint = 0 ) : Array{
		
		
		/*var debug:Boolean = false;
		if (Config.DEBUG && Config.DEBUG_LEVEL > 3) {
			debug = true;
		}
	*/	
		
	
	
	
        d++ ;
		
		//trace(": ae: " + canvas.activeElements.length +  " " + canvas.canvases.length + " depth:" + d);
		
		var activeElements:Array = canvas.activeElements;
		var innerCanvases:Array = canvas.canvases;
		
        for ( var i:uint = 0  ; i < innerCanvases.length; i++) {
				activeElements = arrConcatUnique( activeElements, getActiveElementsRecursive( innerCanvases[i], d ) ); 
			//trace(": new ae: " + canvas.activeElements.length + " depth:" + innerCanvases[i]);
        }

        return activeElements;
		
		

    }
}