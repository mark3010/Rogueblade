//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 in_Texel;

void main()
{
	vec4 newColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );	
	vec2 pixelSizeSt = in_Texel * 1.0; //for horizontal / vertical drawing
	vec2 pixelSizeDg = in_Texel * 1.0; //for diagonal drawing
	
	if(texture2D(gm_BaseTexture, v_vTexcoord).a == 1.0) {
		float alpha = 1.0;
		
		//look for empty spaces around pixel
		//top
		alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x, v_vTexcoord.y + pixelSizeSt.y )).a);
		//alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x + pixelSizeDg.x, v_vTexcoord.y + pixelSizeDg.y )).a);
		//alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x - pixelSizeDg.x, v_vTexcoord.y + pixelSizeDg.y )).a);
		//right
		alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x + pixelSizeSt.x, v_vTexcoord.y )).a);
		//alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x + pixelSizeDg.x, v_vTexcoord.y + pixelSizeDg.y )).a);
		//alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x + pixelSizeDg.x, v_vTexcoord.y - pixelSizeDg.y )).a);
		//bottom
		alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x, v_vTexcoord.y - pixelSizeSt.y )).a);
		//alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x + pixelSizeDg.x, v_vTexcoord.y - pixelSizeDg.y )).a);
		//alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x - pixelSizeDg.x, v_vTexcoord.y - pixelSizeDg.y )).a);
		//left
		alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x - pixelSizeSt.x, v_vTexcoord.y )).a);
		//alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x - pixelSizeDg.x, v_vTexcoord.y + pixelSizeDg.y )).a);
		//alpha = min(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x - pixelSizeDg.x, v_vTexcoord.y - pixelSizeDg.y )).a);
		
		//id empty space, recolor
		if(alpha == 0.0) {
			newColor = vec4(0.8,0.8,0.8,1.0);
		}
	}
	
    gl_FragColor = newColor;
}
