package systems;

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
}