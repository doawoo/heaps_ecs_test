package hook;

import polygonal.ds.BitVector;

class Entity {
    private var compVector:BitVector;
    private var world:World;
    private var components:Array<Component>;

    public function new(world:World) {
        this.world = world;
        compVector = new BitVector(world.getBitVectorLen());
        components = new Array<Component>();
    }

    public function addComponent(compClass:Class<Component>, args:Array<Dynamic>):Component {
        var compBitIndex = world.getBitIndexForComponent(compClass);
        
        if (compBitIndex < 0) {
            return null;
        }

        var comp = Type.createInstance(compClass, args);

        compVector.set(compBitIndex);

        components.push(comp);

        return comp;
    }

    public function getBitVector():BitVector {
        return compVector;
    }

    public function getComponents(compClass:Class<Component>):Array<Component> {
        return components.filter(comp -> Type.getClass(comp) == compClass);
    }
}