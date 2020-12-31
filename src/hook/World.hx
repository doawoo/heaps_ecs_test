package hook;

import h2d.Scene;
import util.Logger;

class World {
    private var name:String;
    private var logger:Logger;

    private var scene:Scene;
    private var app:hxd.App;

    private var componentClasses:Array<Class<Component>>;
    private var systemClasses:Array<Class<System>>;

    private var systemsToBeAdded = new Array<System>();
    private var systems:Array<System> = new Array<System>();
    private var entities:Array<Entity> = new Array<Entity>();

    public function new(components:Array<Class<Component>>, systems:Array<Class<System>>, name:String, scene:Scene, app:hxd.App) {
        this.name = name;
        this.componentClasses = components;
        this.systemClasses = systems;
        this.scene = scene;
        this.app = app;

        this.logger = new Logger('World ($name)');
    }

    public function init() {
        logger.info("init()");
        if (scene == null || app == null) {
            logger.fatal("App or Scene is null!");
            return;
        }
        
        app.setScene(scene);

        // Create all the systems
        logger.debug("Creating world systems...");
        for (sysClass in systemClasses) {
            systemsToBeAdded.push(Type.createInstance(sysClass, [this]));
            logger.debug("Created system: " + Type.getClassName(sysClass));
        }
    }

    public function getScene():Scene {
        return scene;
    }

    public function getBitVectorLen():Int {
        return componentClasses.length;
    }

    public function getBitIndexForComponent(find:Class<Component>):Int {
        var index = componentClasses.indexOf(find);
        if (index < 0) {
            logger.error('The component of type "$find" does not exist in this world! Bit index will be 0!');
            return 0;
        }

        return index;
    }

    public function update(dt:Float):Void {
        // Add any systems pending to be added
        for (system in systemsToBeAdded) {
            systems.push(system);
            system.onAddedToWorld();
            logger.debug("System added to world: " + system.getName());
        }
        systemsToBeAdded = [];

        // Update all systems that are enabled
        for (system in systems) {
            if (!system.isEnabled()) {
                continue;
            }

            system.process(dt);
        }
    }

    public function addSystem(sys:System):Void {
        if (systemsToBeAdded.contains(sys)) {
            return;
        }

        systemsToBeAdded.push(sys);
    }

    public function removeSystem(sys:System):Void {
        sys.onBeforeRemovedFromWorld();
        systems.remove(sys);
    }

    public function addEntity(ent:Entity):Void {
        if (entities.contains(ent)) {
            logger.warn('Entity already exists in the world, not adding again!');
            return;
        }

        entities.push(ent);

        // tell entity systems about this new entity 
        for (system in systems) {
            system.onEntityAddedToWorld(ent);
        }
    }

    public function removeEntity(ent:Entity):Void {
        // tell entity systems this entity is about to be removed
        for (system in systems) {
            system.onBeforeEntityRemovedFromWorld(ent);
        }

        entities.remove(ent);
    }
}