package hook;

class Component {
    private var dirty:Bool = false;

    public function new() {
        // STUB
    }

    public function makeClean():Void {
        dirty = false;
    }

    public function makeDirty():Void {
        dirty = true;
    }

    public function isDirty():Bool {
        return dirty;
    }
}