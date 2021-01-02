package components;

import h2d.Tile;
import h3d.Vector;
import h2d.Bitmap;

class BitmapComponent extends hook.Component {
    private var bitmap:Bitmap;

    public function new(tile:Tile) {
        super();
        this.bitmap = new Bitmap(tile);
    }

    public function getUnderlyingBitmap():Bitmap {
        return bitmap;
    }

    public function setPosition(pos:Vector):Void {
        bitmap.setPosition(pos.x, pos.y);
    }
}