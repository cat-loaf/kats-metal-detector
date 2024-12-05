import { system, world, EntityComponentTypes, EntityOnFireComponent } from "@minecraft/server"

system.runInterval(()=>{
    for (const player of world.getPlayers()) {
        if (player.isEmoting) {
            player.setOnFire(1,true);
            player.sendMessage(`${player.name}, STOP EMOTING!`)
        }
    }
}, 20);  