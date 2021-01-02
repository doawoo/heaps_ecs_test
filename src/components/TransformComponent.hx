package components;

import h3d.Vector;

class TransformComponent extends hook.Component {
    private var location:Vector;
    private var scale:Vector;

    public function new(x:Float, y:Float) {
        location = new Vector(x, y);
        scale = new Vector(1, 1);
        super();
    }

    public function getLocation():Vector {
        return location;
    }

    public function getScale():Vector {
        return scale;
    }
}