package ;

#if flash
import flash.display.Sprite;
import flash.globalization.NumberFormatter;
import flash.Lib;
#else
import nme.display.Sprite;
import nme.Lib;
#end

import com.nodename.lisp.Cons;
import com.nodename.lisp.ConsTreeImage;
import com.nodename.lisp.SExpressionParser;

/**
 * ...
 * @author Alan Shaw
 */


using com.nodename.lisp.SExpressionParser;
class Main extends Sprite
{
	private static inline var XPAD:Float = 40;
	private static inline var YPAD:Float = 20;
	
	static function main() 
	{
		#if flash
			new Main();
		#else
			Lib.create(function() { new Main(); }, 1200,600,5,0xccccff,(1*Lib.HARDWARE) | Lib.RESIZABLE);
		#end
	}
	
	public function new()
	{
		super();
		Lib.current.addChild(this);

		
		var sum:String = "
		  (lambda (list) (sum_ list 0))
		";
		
		var sum_:String = "
		  (lambda (list result)
		   (cond ((null list) result)
				(t (sum_ (cdr list) (+ (car list) result)))))
		";
		
		var simpleList:String = "(xor (- X Y) (bw-noise 338 2 0.7551622059))";
		
				
		var expression = sum_.parse();
		var tree = new ConsTreeImage(expression);
		var bounds = #if flash tree.getBounds(tree) #elseif nme tree.nmeGetPixelBounds() #end ;
		tree.x = XPAD - bounds.left;
		tree.y = YPAD;
		addChild(tree);
	}

}