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

    public override function processEntity(entity:Entity, dt:Float) {
        super.processEntity(entity, dt);

        var bitmapComps = entity.getComponents(BitmapComponent);
        var transformComp = entity.getComponents(TransformComponent)[0];

        for (comp in bitmapComps) {
            if (!comp.isDirty() && !transformComp.isDirty()) {
                continue;
            }

            var b:BitmapComponent = cast comp;
            var t:TransformComponent = cast transformComp;
            var calcLocation = t.getLocation().add(b.getOffset());

            var calcScaleX = b.getScale().x * t.getScale().x;
            var calcScaleY = b.getScale().y * t.getScale().y;
            
            b.setRotation(t.getRotationRad());
            b.setWorldPosition(calcLocation);
            b.setWorldScaleXY(calcScaleX, calcScaleY);
            b.makeClean();
        }

        transformComp.makeClean();
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
            var calcLocation = transformComp.getLocation().add(b.getOffset());

            var calcScaleX = b.getScale().x * transformComp.getScale().x;
            var calcScaleY = b.getScale().y * transformComp.getScale().y;
            
            b.setWorldPosition(calcLocation);
            b.setWorldScaleXY(calcScaleX, calcScaleY);
            getWorld().getScene().addChild(
                b.getUnderlyingBitmap()
            );
        }
    }
}