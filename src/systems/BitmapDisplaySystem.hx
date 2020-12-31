package systems;

import hook.Entity;
import components.BitmapComponent;

import hook.System;
import hook.World;

class BitmapDisplaySystem extends System {
    public override function new(world:World) {
        super("BitmapDisplaySystem", world,
        [
            // Required the entity has all these component types
            BitmapComponent
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

        // Add the bitmap from the entity to the world
        world.getScene().addChild(
            ent.getComponent(BitmapComponent)
        )
    }
}