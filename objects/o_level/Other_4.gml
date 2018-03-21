/// @description Apply the alpha shader
above_layer_alpha = 1.0;
above_layer_alpha_target = 1.0;
above_layer_id = layer_get_id("WallTilesAbove");
layer_shader(above_layer_id, shd_alpha);