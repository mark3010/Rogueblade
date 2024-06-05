{
  "$GMRoom":"",
  "%Name":"room_arena",
  "creationCodeFile":"",
  "inheritCode":true,
  "inheritCreationOrder":true,
  "inheritLayers":true,
  "instanceCreationOrder":[
    {"name":"inst_6172B092","path":"rooms/room_arena/room_arena.yy",},
    {"name":"inst_7212128B","path":"rooms/room_arena/room_arena.yy",},
  ],
  "isDnd":false,
  "layers":[
    {"$GMREffectLayer":"","%Name":"fx_gaussian","depth":0,"effectEnabled":true,"effectType":"_effect_gaussian_blur","gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"fx_gaussian","properties":[
        {"name":"g_numDownsamples","type":0,"value":"2",},
        {"name":"g_numPasses","type":0,"value":"2",},
        {"name":"g_intensity","type":0,"value":"1",},
      ],"resourceType":"GMREffectLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":false,},
    {"$GMRInstanceLayer":"","%Name":"lay_pause","depth":100,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"","%Name":"inst_7212128B","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":true,"isDnd":false,"name":"inst_7212128B","objectId":{"name":"obj_pause_display","path":"objects/obj_pause_display/obj_pause_display.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":112.0,"y":96.0,},
      ],"layers":[],"name":"lay_pause","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRInstanceLayer":"","%Name":"lay_instances","depth":200,"effectEnabled":true,"effectType":null,"gridX":8,"gridY":8,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"","%Name":"inst_6172B092","colour":4294967295,"frozen":false,"hasCreationCode":true,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":true,"isDnd":false,"name":"inst_6172B092","objectId":{"name":"obj_gameinit","path":"objects/obj_gameinit/obj_gameinit.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":416.0,"y":256.0,},
      ],"layers":[],"name":"lay_instances","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRBackgroundLayer":"","%Name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4280819996,"depth":300,"effectEnabled":true,"effectType":"_filter_gradient","gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background","properties":[
        {"name":"g_GradientColour1","type":1,"value":"#FF51433A",},
        {"name":"g_GradientColour2","type":1,"value":"#FF070703",},
        {"name":"g_GradientPosition1","type":0,"value":"0.5",},
        {"name":"g_GradientPosition1","type":0,"value":"0",},
        {"name":"g_GradientPosition2","type":0,"value":"0.5",},
        {"name":"g_GradientPosition2","type":0,"value":"1",},
        {"name":"g_GradientMode","type":0,"value":"1",},
      ],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":false,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"$GMREffectLayer":"","%Name":"Effect_4_1","depth":10000,"effectEnabled":true,"effectType":"_filter_gradient","gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Effect_4_1","properties":[
        {"name":"g_GradientColour1","type":1,"value":"#00FFFF28",},
        {"name":"g_GradientColour2","type":1,"value":"#B82D1710",},
        {"name":"g_GradientPosition1","type":0,"value":"0.5",},
        {"name":"g_GradientPosition1","type":0,"value":"0",},
        {"name":"g_GradientPosition2","type":0,"value":"0.5",},
        {"name":"g_GradientPosition2","type":0,"value":"1",},
        {"name":"g_GradientMode","type":0,"value":"0",},
      ],"resourceType":"GMREffectLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":false,},
    {"$GMREffectLayer":"","%Name":"Effect_4","depth":10100,"effectEnabled":true,"effectType":"_filter_ripples","gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Effect_4","properties":[
        {"name":"g_RipplesPosition","type":0,"value":"480",},
        {"name":"g_RipplesPosition","type":0,"value":"400",},
        {"name":"g_RipplesSpeed","type":0,"value":"2",},
        {"name":"g_RipplesWidth","type":0,"value":"110",},
        {"name":"g_RipplesAmplitude","type":0,"value":"1",},
        {"name":"g_RipplesRadius","type":0,"value":"0",},
      ],"resourceType":"GMREffectLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":false,},
    {"$GMRBackgroundLayer":"","%Name":"Background_4","animationFPS":15.0,"animationSpeedType":0,"colour":4294967295,"depth":10200,"effectEnabled":true,"effectType":"_filter_gradient","gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background_4","properties":[
        {"name":"g_GradientColour1","type":1,"value":"#FF8CD1A9",},
        {"name":"g_GradientColour2","type":1,"value":"#FF0A0C0B",},
        {"name":"g_GradientPosition1","type":0,"value":"0.5",},
        {"name":"g_GradientPosition1","type":0,"value":"0",},
        {"name":"g_GradientPosition2","type":0,"value":"0.5",},
        {"name":"g_GradientPosition2","type":0,"value":"1",},
        {"name":"g_GradientMode","type":0,"value":"1",},
      ],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":false,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"$GMREffectLayer":"","%Name":"Effect_3_1","depth":10300,"effectEnabled":true,"effectType":"_filter_gradient","gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Effect_3_1","properties":[
        {"name":"g_GradientColour1","type":1,"value":"#005BF6FF",},
        {"name":"g_GradientColour2","type":1,"value":"#B8000330",},
        {"name":"g_GradientPosition1","type":0,"value":"0.5",},
        {"name":"g_GradientPosition1","type":0,"value":"0",},
        {"name":"g_GradientPosition2","type":0,"value":"0.5",},
        {"name":"g_GradientPosition2","type":0,"value":"1",},
        {"name":"g_GradientMode","type":0,"value":"0",},
      ],"resourceType":"GMREffectLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":false,},
    {"$GMREffectLayer":"","%Name":"Effect_3","depth":10400,"effectEnabled":true,"effectType":"_filter_heathaze","gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Effect_3","properties":[
        {"name":"g_Distort1Speed","type":0,"value":"0.018",},
        {"name":"g_Distort2Speed","type":0,"value":"0.034",},
        {"name":"g_Distort1Scale","type":0,"value":"9.3",},
        {"name":"g_Distort1Scale","type":0,"value":"1.3",},
        {"name":"g_Distort2Scale","type":0,"value":"45.3",},
        {"name":"g_Distort2Scale","type":0,"value":"3.3",},
        {"name":"g_Distort1Amount","type":0,"value":"15",},
        {"name":"g_Distort2Amount","type":0,"value":"18",},
        {"name":"g_ChromaSpreadAmount","type":0,"value":"1.25",},
        {"name":"g_CamOffsetScale","type":0,"value":"1",},
        {"name":"g_DistortTexture","type":2,"value":"_filter_heathaze_noise_sprite",},
      ],"resourceType":"GMREffectLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":false,},
    {"$GMRBackgroundLayer":"","%Name":"Background_3","animationFPS":15.0,"animationSpeedType":0,"colour":4294967295,"depth":10500,"effectEnabled":true,"effectType":"_filter_gradient","gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background_3","properties":[
        {"name":"g_GradientColour1","type":1,"value":"#FF8FBFEF",},
        {"name":"g_GradientColour2","type":1,"value":"#FF0D0D19",},
        {"name":"g_GradientPosition1","type":0,"value":"0.5",},
        {"name":"g_GradientPosition1","type":0,"value":"0",},
        {"name":"g_GradientPosition2","type":0,"value":"0.5",},
        {"name":"g_GradientPosition2","type":0,"value":"1",},
        {"name":"g_GradientMode","type":0,"value":"1",},
      ],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":false,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"$GMREffectLayer":"","%Name":"Effect_2_1","depth":10700,"effectEnabled":true,"effectType":"_filter_gradient","gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Effect_2_1","properties":[
        {"name":"g_GradientColour1","type":1,"value":"#00FA84FF",},
        {"name":"g_GradientColour2","type":1,"value":"#A8000000",},
        {"name":"g_GradientPosition1","type":0,"value":"0.5",},
        {"name":"g_GradientPosition1","type":0,"value":"0",},
        {"name":"g_GradientPosition2","type":0,"value":"0.5",},
        {"name":"g_GradientPosition2","type":0,"value":"1",},
        {"name":"g_GradientMode","type":0,"value":"0",},
      ],"resourceType":"GMREffectLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":false,},
    {"$GMREffectLayer":"","%Name":"Effect_2","depth":10800,"effectEnabled":true,"effectType":"_filter_underwater","gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Effect_2","properties":[
        {"name":"g_Distort1Speed","type":0,"value":"0.014",},
        {"name":"g_Distort2Speed","type":0,"value":"0.025",},
        {"name":"g_Distort1Scale","type":0,"value":"20",},
        {"name":"g_Distort1Scale","type":0,"value":"2",},
        {"name":"g_Distort2Scale","type":0,"value":"100",},
        {"name":"g_Distort2Scale","type":0,"value":"10",},
        {"name":"g_Distort1Amount","type":0,"value":"2",},
        {"name":"g_Distort2Amount","type":0,"value":"6",},
        {"name":"g_ChromaSpreadAmount","type":0,"value":"6.25",},
        {"name":"g_CamOffsetScale","type":0,"value":"1",},
        {"name":"g_GlintCol","type":1,"value":"#FFAD9F22",},
        {"name":"g_TintCol","type":1,"value":"#FF825F30",},
        {"name":"g_AddCol","type":1,"value":"#FF000000",},
        {"name":"g_DistortTexture","type":2,"value":"_filter_underwater_noise_sprite",},
      ],"resourceType":"GMREffectLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":false,},
    {"$GMRBackgroundLayer":"","%Name":"Background_2","animationFPS":15.0,"animationSpeedType":0,"colour":4294967295,"depth":10900,"effectEnabled":true,"effectType":"_filter_gradient","gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background_2","properties":[
        {"name":"g_GradientColour1","type":1,"value":"#FFFBFCB5",},
        {"name":"g_GradientColour2","type":1,"value":"#FF070500",},
        {"name":"g_GradientPosition1","type":0,"value":"0.5",},
        {"name":"g_GradientPosition1","type":0,"value":"0",},
        {"name":"g_GradientPosition2","type":0,"value":"0.5",},
        {"name":"g_GradientPosition2","type":0,"value":"1",},
        {"name":"g_GradientMode","type":0,"value":"1",},
      ],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":false,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"$GMREffectLayer":"","%Name":"Effect_1","depth":11000,"effectEnabled":true,"effectType":"_effect_windblown_particles","gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Effect_1","properties":[
        {"name":"param_sprite","type":2,"value":"spr_empty",},
        {"name":"param_num_particles","type":0,"value":"40",},
        {"name":"param_particle_spawn_time","type":0,"value":"100",},
        {"name":"param_particle_spawn_all_at_start","type":0,"value":"1",},
        {"name":"param_warmup_frames","type":0,"value":"0",},
        {"name":"param_particle_mass_min","type":0,"value":"0.005",},
        {"name":"param_particle_mass_max","type":0,"value":"0.01",},
        {"name":"param_particle_start_sprite_scale","type":0,"value":"1",},
        {"name":"param_particle_end_sprite_scale","type":0,"value":"1",},
        {"name":"param_particle_col_1","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_alt_1","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_2","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_alt_2","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_2_pos","type":0,"value":"0.33",},
        {"name":"param_particle_col_enabled_2","type":0,"value":"0",},
        {"name":"param_particle_col_3","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_alt_3","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_3_pos","type":0,"value":"0.66",},
        {"name":"param_particle_col_enabled_3","type":0,"value":"0",},
        {"name":"param_particle_col_4","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_col_alt_4","type":1,"value":"#FFFFFFFF",},
        {"name":"param_particle_initial_velocity_range_x_min","type":0,"value":"-10",},
        {"name":"param_particle_initial_velocity_range_x_max","type":0,"value":"10",},
        {"name":"param_particle_initial_velocity_range_y_min","type":0,"value":"-10",},
        {"name":"param_particle_initial_velocity_range_y_max","type":0,"value":"10",},
        {"name":"param_particle_initial_rotation_min","type":0,"value":"0",},
        {"name":"param_particle_initial_rotation_max","type":0,"value":"360",},
        {"name":"param_particle_rot_speed_min","type":0,"value":"-360",},
        {"name":"param_particle_rot_speed_max","type":0,"value":"360",},
        {"name":"param_particle_align_vel","type":0,"value":"0",},
        {"name":"param_particle_lifetime_min","type":0,"value":"100",},
        {"name":"param_particle_lifetime_max","type":0,"value":"100",},
        {"name":"param_particle_update_skip","type":0,"value":"1",},
        {"name":"param_particle_spawn_border_prop","type":0,"value":"0.25",},
        {"name":"param_particle_src_blend","type":0,"value":"5",},
        {"name":"param_particle_dest_blend","type":0,"value":"6",},
        {"name":"param_trails_only","type":0,"value":"1",},
        {"name":"param_trail_chance","type":0,"value":"40",},
        {"name":"param_trail_lifetime_min","type":0,"value":"0.5",},
        {"name":"param_trail_lifetime_max","type":0,"value":"1",},
        {"name":"param_trail_thickness_min","type":0,"value":"0.15",},
        {"name":"param_trail_thickness_max","type":0,"value":"0.15",},
        {"name":"param_trail_col_1","type":1,"value":"#2121E5FF",},
        {"name":"param_trail_col_alt_1","type":1,"value":"#30FFFCA8",},
        {"name":"param_trail_col_2","type":1,"value":"#19FFFFFF",},
        {"name":"param_trail_col_alt_2","type":1,"value":"#3FFFFFFF",},
        {"name":"param_trail_col_2_pos","type":0,"value":"0.5",},
        {"name":"param_trail_col_enabled_2","type":0,"value":"1",},
        {"name":"param_trail_col_3","type":1,"value":"#19FFFFFF",},
        {"name":"param_trail_col_alt_3","type":1,"value":"#3FFFFFFF",},
        {"name":"param_trail_col_3_pos","type":0,"value":"0.66",},
        {"name":"param_trail_col_enabled_3","type":0,"value":"0",},
        {"name":"param_trail_col_4","type":1,"value":"#00FFFFFF",},
        {"name":"param_trail_col_alt_4","type":1,"value":"#00FFFFFF",},
        {"name":"param_trail_min_segment_length","type":0,"value":"10",},
        {"name":"param_trail_src_blend","type":0,"value":"5",},
        {"name":"param_trail_dest_blend","type":0,"value":"6",},
        {"name":"param_num_blowers","type":0,"value":"3",},
        {"name":"param_blower_size_min","type":0,"value":"0.2",},
        {"name":"param_blower_size_max","type":0,"value":"0.6",},
        {"name":"param_blower_speed_min","type":0,"value":"0.2",},
        {"name":"param_blower_speed_max","type":0,"value":"0.5",},
        {"name":"param_blower_rot_speed_min","type":0,"value":"-180",},
        {"name":"param_blower_rot_speed_max","type":0,"value":"180",},
        {"name":"param_blower_force_min","type":0,"value":"1",},
        {"name":"param_blower_force_max","type":0,"value":"2",},
        {"name":"param_blower_camvec_scale","type":0,"value":"-1",},
        {"name":"param_force_grid_sizex","type":0,"value":"8",},
        {"name":"param_force_grid_sizey","type":0,"value":"8",},
        {"name":"param_wind_vector_x","type":0,"value":"0",},
        {"name":"param_wind_vector_y","type":0,"value":"0",},
        {"name":"param_dragcoeff","type":0,"value":"1",},
        {"name":"param_grav_accel","type":0,"value":"200",},
        {"name":"param_debug_grid","type":0,"value":"0",},
      ],"resourceType":"GMREffectLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRBackgroundLayer":"","%Name":"Background_1","animationFPS":15.0,"animationSpeedType":0,"colour":4280819996,"depth":11100,"effectEnabled":true,"effectType":"_filter_gradient","gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":true,"inheritLayerSettings":true,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background_1","properties":[
        {"name":"g_GradientColour1","type":1,"value":"#FF51433A",},
        {"name":"g_GradientColour2","type":1,"value":"#FF070703",},
        {"name":"g_GradientPosition1","type":0,"value":"0.5",},
        {"name":"g_GradientPosition1","type":0,"value":"0",},
        {"name":"g_GradientPosition2","type":0,"value":"0.5",},
        {"name":"g_GradientPosition2","type":0,"value":"1",},
        {"name":"g_GradientMode","type":0,"value":"1",},
      ],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "name":"room_arena",
  "parent":{
    "name":"Rooms",
    "path":"folders/Rooms.yy",
  },
  "parentRoom":{
    "name":"room_init_atmospheres",
    "path":"rooms/room_init_atmospheres/room_init_atmospheres.yy",
  },
  "physicsSettings":{
    "inheritPhysicsSettings":true,
    "PhysicsWorld":false,
    "PhysicsWorldGravityX":0.0,
    "PhysicsWorldGravityY":10.0,
    "PhysicsWorldPixToMetres":0.1,
  },
  "resourceType":"GMRoom",
  "resourceVersion":"2.0",
  "roomSettings":{
    "Height":720,
    "inheritRoomSettings":true,
    "persistent":false,
    "Width":1280,
  },
  "sequenceId":null,
  "views":[
    {"hborder":32,"hport":540,"hspeed":-1,"hview":540,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":960,"wview":960,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings":{
    "clearDisplayBuffer":true,
    "clearViewBackground":false,
    "enableViews":true,
    "inheritViewSettings":true,
  },
  "volume":1.0,
}