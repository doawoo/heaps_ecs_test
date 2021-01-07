package systems;

import components.SpeenComponent;
import components.TransformComponent;
import hook.Entity;

import hook.System;
import hook.World;

class SpeenSystem extends System {
    public override function new(world:World) {
        super("BitmapDisplaySystem", world,
        [
            // Required the entity has all these component types
            SpeenComponent,
            TransformComponent,
        ], 
        [
            // Requires the entity has none of these component types
        ]
        );
    }

    public override function processEntity(entity:Entity, dt:Float) {
        super.processEntity(entity, dt);

        var speenComp:SpeenComponent = cast entity.getComponents(SpeenComponent)[0];
        var transformComp:TransformComponent = cast entity.getComponents(TransformComponent)[0];

        transformComp.setRotationRad(transformComp.getRotationRad() + (speenComp.getIncrement() * dt));
    }
}