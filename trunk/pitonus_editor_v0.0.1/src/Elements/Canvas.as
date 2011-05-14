package Elements
{
    import com.sibirjak.asdpc.button.Button;
	import org.as3commons.ui.layout.Display;
	import org.as3commons.ui.layout.HLayout;
    import org.as3commons.ui.layout.shortcut. * ;
    import org.as3commons.ui.layout.debugger.LayoutDebugger;
    import org.as3commons.ui.layout.HGroup;
    import org.as3commons.ui.layout.VGroup;


    import flash.display. * ;
    import flash.text.TextField;
    import flash.utils.getDefinitionByName;
    import flash.display.Sprite;

    import Configuration. * ;
    import Utils. * ;
    import Managers. * ;

    public class Canvas extends Element implements IElement
    {
        protected var _canvasObject 	 : Object;
        protected var _elements 		 : Array;
        protected var _activeElements	 : Array;
        protected var _canvasLayout	 : VGroup;

        protected var _foreground 	 : Sprite;
        protected var _background 	 : Sprite;

        private var initialized : Boolean = false;


        override public function init( obj : Object ) : void {

            _properties = obj;


            var properties : Object =  new Object();
            // properties["pageId"] 	 	 = Attributes.NUMBER;
            properties["name"] 	 		 = Attributes.INPUT
            properties["elementType"] 	 = Attributes.INPUT
            properties["elements"] 	 	 = Attributes.SYSTEM;

            // if( validateProperties( properties ) ){

            _canvasObject = obj;
            _foreground = new Sprite();
            _background = new Sprite();
            this.addChild( _background );
            this.addChild( _foreground );
            initialized = true;

            setPosition();
            addBounds();
            draw( _properties );
        }

        public function get elements() : Array {
            return _elements;
        }

        public function get activeElements() : Array {
            return _activeElements;
        }


        private function draw( obj : Object ) : void {


            if ( initialized ) {
                // new array to hold references to Elements instatnces on Page
                _elements = new Array();
                _activeElements = new Array();


                var elementObjects : Array = new Array();
                for each( var elementObj : * in _canvasObject['elements'] ) {
					
                    var aviableElements : Object = Manager.getSiteElementClasses();
					
                    var elementTypeNum : int =  aviableElements['names'].indexOf( elementObj['elementType'] );
                    if ( elementTypeNum != - 1 ) {

                        var element : * = createElement( aviableElements['runtimeClassRefs'][elementTypeNum], elementObj );
								
						if ( elementObj['elementType'] == 'Canvas' ){
							trace("AElements: " + element.activeElements.length);
							dispatchEvent( new SimpleEvent( SimpleEvent.SIMPLE_EVENT, element.activeElements ) );
						}
						
                        _foreground.addChild( element );

						_elements.push(element);
						
                        if ( element.isProperty( "action" ) ) 
							_activeElements.push( element );

                    }

                    elementObjects.push( elementObj );
                }


				_canvasLayout = vgroup();

				var hl:HLayout = hlayout("maxContentWidth", uint( getProperty( "w" ) ) , "marginX", 10, "marginY", 10, "hGap" , 10, "vGap" , 10);
		
				for each(var e:* in _elements) {
					if ( e.getProperty('identifier') ) {
						//trace("identifier found: "  + e.getProperty('identifier'));
						hl.add( display("id", e.getProperty('identifier'), e ,  "marginY", 20) );
					}else{
						hl.add(  e );
					}
				}

				_canvasLayout.add(hl);

                _canvasLayout.layout( this );


                if ( Config.DEBUG && Config.DEBUG_LEVEL > 4 ) {
                    var debugger : LayoutDebugger = new LayoutDebugger();
                    addChild( debugger );
                    debugger.debug( _canvasLayout );
                }





            }

        }



        public function get foreground() : * {
            return _foreground;
        }
        public function get background() : * {
            return _background;
        }
		
		public function get canvasObject() : Object {
            return _canvasObject;
        }
		
		public function get canvasLayout() : VGroup {
            return _canvasLayout;
        }
		
        public function removeElements() : void {
			
/*			
		if (Config.DEBUG && Config.DEBUG_LEVEL > 1) 
*/
            trace( "Canvas.removeElements() " + _foreground.numChildren );
            
/*			for ( var i : uint = 0; i < _background.numChildren; i ++ ) {
				trace("_background.numChildren " + i);
                _background.removeChild( _background.getChildAt( i ) );
            }
            for ( var i : uint = 0; i < _foreground.numChildren; i ++ ) {
				trace("_foreground.numChildren " + i);
                _foreground.removeChild( _foreground.getChildAt( i ) );
            }
/*			for ( i = 0; i < _elements.lenth; i ++ ) {
				trace("_foreground.numChildren " + i);
                _foreground.removeChild( _elements[i] );
            }
			for ( i = 0; i < _activeElements.lenth; i ++ ) {
				trace("_foreground.numChildren " + i);
                _foreground.removeChild( _activeElements[i] );
            }*/
            _elements = null;
            _activeElements = null;
			
            /* for each( var element : Element in _elements ) {
            trace( "!!! [Error] Element is not dele" + element + " : " + element.getProperty( 'elementType' ) );
            // this.removeChild( element );
            } */

        }
    }

}