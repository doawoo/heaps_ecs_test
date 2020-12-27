package hook;

import h2d.Scene;
import util.Logger;

class World {
    private var name:String;
    private var logger:Logger;

    private var scene:Scene;
    private var app:hxd.App;

    private var components:Array<Class<Component>>;

    public function new(components:Array<Class<Component>>, name:String, scene:Scene, app:hxd.App) {
        this.name = name;
        this.components = components;
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
    }

    public function getBitVectorLen():Int {
        return components.length;
    }
}