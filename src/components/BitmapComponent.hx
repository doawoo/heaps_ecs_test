package components;

import h2d.Tile;
import h3d.Vector;
import h2d.Bitmap;

class BitmapComponent extends hook.Component {
    private var bitmap:Bitmap;
    private var offset:Vector;
    private var scale:Vector;

    public function new(tile:Tile) {
        super();
        this.bitmap = new Bitmap(tile);
        this.offset = new Vector(0, 0);
        this.scale = new Vector(1, 1);
    }

    public function getUnderlyingBitmap():Bitmap {
        return bitmap;
    }

    /////
    // Mutator Functions
    ////

    public function setWorldPosition(pos:Vector):Void {
        bitmap.setPosition(pos.x, pos.y);
    }

    public function setWorldScale(scale:Vector):Void {
        bitmap.scaleX = scale.x;
        bitmap.scaleY = scale.y;
    }

    public function setWorldScaleXY(x:Float, y:Float):Void {
        bitmap.scaleX = x;
        bitmap.scaleY = y;
    }

    ////

    public function setOffset(?x:Float, ?y:Float):Void {
        if (x != null) {
            offset.x = x;
            makeDirty();
        }

        if (y != null) {
            offset.y = y;
            makeDirty();
        }
    }

    public function setScale(?x:Float, ?y:Float):Void {
        if (x != null) {
            scale.x = x;
            makeDirty();
        }

        if (y != null) {
            scale.y = y;
            makeDirty();
        }
    }

    public function setRotation(rot:Float):Void {
        bitmap.rotation = rot;
    }

    public function getScale():Vector {
        return scale;
    }

    public function getOffset():Vector {
        return offset;
    }
}