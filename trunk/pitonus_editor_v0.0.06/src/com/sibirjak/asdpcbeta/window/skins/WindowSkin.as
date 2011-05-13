/**
 * ActionScript Data Provider Controls
 * 
 * Copyright (c) 2010 Jens Struwe, http://www.sibirjak.com/
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package com.sibirjak.asdpcbeta.window.skins {
	import com.sibirjak.asdpc.core.skins.BackgroundSkin;

	/**
	 * @author jes 25.11.2009
	 */
	public class WindowSkin extends BackgroundSkin {

		/* Styles */
		
		public static const style_cornerRadius : String = "windowSkin_cornerRadius";

		public static const style_backgroundLightColor : String = "windowSkin_backgroundLightColor";
		public static const style_backgroundDarkColor : String = "windowSkin_backgroundDarkColor";
		public static const style_backgroundAlpha : String = "windowSkin_backgroundAlpha";

		public static const style_border : String = "windowSkin_border";
		public static const style_borderLightColor : String = "windowSkin_borderLightColor";
		public static const style_borderDarkColor : String = "windowSkin_borderDarkColor";

		public function WindowSkin() {
			setDefaultStyles([
				style_cornerRadius, 1,

				style_backgroundAlpha, 1,
				style_backgroundLightColor, 0xFFFFFF,
				style_backgroundDarkColor, 0xF5F5F5,

				style_border, true,
				style_borderLightColor, 0xCCCCCC,
				style_borderDarkColor, 0x666666
			]);
		}

		override protected function cornerRadius() : uint {
			return getStyle(style_cornerRadius);
		}

		override protected function backgroundAlpha() : Number {
			return getStyle(style_backgroundAlpha);
		}

		override protected function backgroundColors() : Array {
			return [getStyle(style_backgroundLightColor), getStyle(style_backgroundDarkColor)];
		}

		override protected function border() : Boolean {
			return getStyle(style_border);
		}

		override protected function borderColors() : Array {
			return [getStyle(style_borderLightColor), getStyle(style_borderDarkColor)];
		}

	}
}
