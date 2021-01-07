package components;

import hook.Component;

class SpeenComponent extends Component {
    private var increment:Float = 0.0;

    public function new(?increment:Float) {
        super();
        this.increment = increment;
    }

    public function setIncrement(inc:Float):Void {
        increment = inc;
    }

    public function getIncrement():Float {
        return increment;
    }
}