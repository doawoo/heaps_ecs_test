package components;

import h3d.Vector;

class TransformComponent extends hook.Component {
    private var location:Vector;
    private var scale:Vector;
    private var rotationRadians:Float = 0;

    public function new(x:Float, y:Float) {
        location = new Vector(x, y);
        scale = new Vector(1, 1);
        super();
    }

    public function setLocation(?x:Float, ?y:Float):Void {
        if (x != null) {
            location.x = x;
            makeDirty();
        }

        if (y != null) {
            location.y = y;
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

    public function setRotationRad(rotation:Float) {
        rotationRadians = rotation;
        makeDirty();
    }

    public function getLocation():Vector {
        return location;
    }

    public function getScale():Vector {
        return scale;
    }

    public function getRotationRad():Float {
        return rotationRadians;
    }
}