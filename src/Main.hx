import polygonal.ds.BitVector;
import systems.BitmapDisplaySystem;
import components.BitmapComponent;
import h2d.Scene;
import util.Logger;

import hook.World;

class Main extends hxd.App {
    private var world:World;
    private var logger:Logger;
    private var scene:Scene;

    override function init() {
        logger = new Logger("Main");
        logger.debug("Startup!");

        scene = new Scene();

        world = new World(
        [
            // Register components with the world here
            BitmapComponent,
        ], 
        [
            // Register systems with the world
            BitmapDisplaySystem,
        ],
        "test-world", scene, this);

        world.init();
    }

    private override function update(dt:Float) {
        world.update(dt);
        super.update(dt);
    }

    static function main() {
        new Main();
    }
}