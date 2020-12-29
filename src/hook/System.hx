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

    private var entities:Array<Entity>;

    public function new(name:String, world:World, has:Array<Class<Component>>, noneOf:Array<Class<Component>>) {
        logger = new Logger(name);
        this.world = world;
        this.conditionsHas = new BitVector(world.getBitVectorLen());
        this.conditionsHasNoneOf = new BitVector(world.getBitVectorLen());
        this.entities = new Array<Entity>();
    }

    ////
    // World Callbacks
    ////

    public function onAddedToWorld():Void {
        // Called when the system is added to the world
        logger.info('System has been added to world!');
    }

    public function onBeforeRemovedFromWorld():Void {
        // Called just before the system is removed from the world
        logger.warn('System is going to be removed from the world!');
    }

    ////
    // Entity Callbacks
    ////

    public function onEntityAddedToWorld(ent:Entity):Void {
        if (wantsEntity(ent)) {
            entities.push(ent);
        }
    }

    public function onBeforeEntityRemovedFromWorld(ent:Entity):Void {
        entities.remove(ent);
    }

    public function processEntity(entity:Entity):Void {
        // Called for each entity this system cares about
        // STUB
    }

    public function process(deltaTime:Float) {
        if (!enabled) {
            return;
        }

        for (ent in entities) {
            processEntity(ent);
        }
    }

    private function wantsEntity(ent:Entity):Bool {
        var entVector = ent.getBitVector();

        // ensure all the components we need are on the ent
        for (i in 0...world.getBitVectorLen()) {
            if (conditionsHas.has(i) && !entVector.has(i)) {
                return false;
            } 
        }

        // ensure none of the components we do not want are missing from the ent
        for (i in 0...world.getBitVectorLen()) {
            if (conditionsHasNoneOf.has(i) && entVector.has(i)) {
                return false;
            } 
        }

        // All conditions passed, system wants this entity
        return true;
    }
}