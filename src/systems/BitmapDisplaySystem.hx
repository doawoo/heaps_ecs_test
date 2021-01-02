package systems;

import components.TransformComponent;
import hook.Entity;
import components.BitmapComponent;

import hook.System;
import hook.World;

class BitmapDisplaySystem extends System {
    public override function new(world:World) {
        super("BitmapDisplaySystem", world,
        [
            // Required the entity has all these component types
            BitmapComponent,
            TransformComponent,
        ], 
        [
            // Requires the entity has none of these component types
        ]
        );
    }

    public override function processEntity(entity:Entity) {
        super.processEntity(entity);
    }
    
    public override function onEntityAddedToWorld(ent:Entity) {
        // Base behaviour from super class
        if (!wantsEntity(ent)) {
            return;
        }

        entities.push(ent);
        var bitmapComps = ent.getComponents(BitmapComponent);
        var transformComp:TransformComponent = cast ent.getComponents(TransformComponent)[0];

        for (comp in bitmapComps) {
            var b:BitmapComponent = cast comp;
            b.setPosition(transformComp.getLocation());
            getWorld().getScene().addChild(
                b.getUnderlyingBitmap()
            );
        }
    }
}