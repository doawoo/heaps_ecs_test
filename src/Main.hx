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

        world = new World([
            // Register components with the world here
            BitmapComponent,
        ], "test-world", scene, this);

        world.init();
    }

    static function main() {
        new Main();
    }
}