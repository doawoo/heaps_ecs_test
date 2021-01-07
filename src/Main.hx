import systems.SpeenSystem;
import components.SpeenComponent;
import h2d.Tile;
import components.TransformComponent;
import hook.Entity;
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

    private var flag = false;

    override function init() {
        logger = new Logger("Main");
        logger.debug("Startup!");

        scene = new Scene();

        world = new World(
        [
            // Register components with the world here
            BitmapComponent,
            TransformComponent,
            SpeenComponent,
        ], 
        [
            // Register systems with the world
            BitmapDisplaySystem,
            SpeenSystem,
        ],
        "test-world", scene, this);

        world.init();
    }

    private override function update(dt:Float) {
        world.update(dt);
        super.update(dt);
        if (flag == false) {
            flag = true;

            var ent = new Entity(world); // make an empty entity
            var logo:Tile = hxd.Res.hxlogo.toTile(); // load a PNG from disk
    
            // Create entity with bitmap and transform components
            ent.addComponent(TransformComponent, [100, 100]);
            ent.addComponent(BitmapComponent, [logo]);
            ent.addComponent(SpeenComponent, [5]);

            var bitmapComp:BitmapComponent = cast ent.getComponents(BitmapComponent)[0];
            var transformComp:TransformComponent = cast ent.getComponents(TransformComponent)[0];

            transformComp.setScale(1, 1.25);

            // Add it to the world
            world.addEntity(ent);
        }
    }

    static function main() {
        hxd.Res.initEmbed();
        new Main();
    }
}