player = instance_create_layer(playerXSpawn,playerYSpawn,layerEntities,obj_player)
player.spawn(false,player.generateSpawnVelocity(true),60)
camera.focus(player.id)