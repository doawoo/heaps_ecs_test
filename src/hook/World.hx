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

    private var systems:Array<System> = new Array<System>();
    private var entity:Array<Entity> = new Array<Entity>();

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
            systems.push(Type.createInstance(sysClass, [this]));
            logger.debug("Created system: " + Type.getClassName(sysClass));
        }
    }

    public function getBitVectorLen():Int {
        return componentClasses.length;
    }
}