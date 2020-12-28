package hook;

import util.Logger;
import polygonal.ds.BitVector;

class System {

    private var logger:Logger;
    
    // Conditions that determine the entities this system cares about
    private var conditionsHas:BitVector;
    private var conditionsHasNoneOf:BitVector;

    private var enabled:Bool = true;

    private var world:World;

    public function new(name:String, world:World, has:Array<Class<Component>>, noneOf:Array<Class<Component>>) {
        logger = new Logger(name);
        this.world = world;
        this.conditionsHas = new BitVector(world.getBitVectorLen());
        this.conditionsHasNoneOf = new BitVector(world.getBitVectorLen());
    }

    ////
    // World Callbacks
    ////

    public function onAddedToWorld():Void {
        // Called when the system is added to the world
    }

    public function onBeforeRemovedFromWorld():Void {
        // Called just before the system is removed from the world
    }

    ////
    // Entity Callbacks
    ////

    public function onEntityAddedToWorld(entity:Entity):Void {
        // Called when a new entity is added to the world
            // This function should determine if the entity is something this system cares about
            // by using the entity's bitvector
    }

    public function onBeforeEntityRemovedFromWorld(entity:Entity):Void {
        // Called just before an entity is removed from the world
    }

    public function processEntity(entity:Entity):Void {
        // Called for each entity this system cares about
    }
}