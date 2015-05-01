package
{
import flash.display.Bitmap;
import flash.utils.Dictionary;
import starling.textures.Texture;
/**
 * ...
 * @author Matthew Bonanno
 */
public class Assets
{
    [Embed(source="../start.png")]
    public static const startButton:Class;

    [Embed(source="../welcomeBG.png")]
    public static const BgWelcome:Class;

    [Embed(source="../ball.png")]
    public static const Ball:Class;

    private static var gameTextures:Dictionary = new Dictionary();
    public static function getTexture(name:String):Texture {
        if (gameTextures[name] == undefined)
        {
            var bitmap:Bitmap = new Assets[name]();
            gameTextures[name] = Texture.fromBitmap(bitmap);
        }
        return gameTextures[name];
    }

    private static function returnARGB(rgb:uint, newAlpha:uint):uint{
        //newAlpha has to be in the 0 to 255 range
        var argb:uint = 0;
        argb += (newAlpha<<24);
        argb += (rgb);
        return argb;
    }
}

}