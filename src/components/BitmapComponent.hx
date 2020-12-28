package components;

import h2d.Bitmap;

class BitmapComponent extends hook.Component {
    private var bitmap:Bitmap;

    public function new() {
        super();
        this.bitmap = new Bitmap();
    }

    public function getUnderlyingBitmap():Bitmap {
        return bitmap;
    }
}