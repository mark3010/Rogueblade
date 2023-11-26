//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 in_Texel;

void main()
{
	vec4 newColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );	
	vec2 pixelSizeSt = in_Texel * 2.0; //for horizontal / vertical drawing
	vec2 pixelSizeDg = in_Texel * 1.0; //for diagonal drawing
	
	if(texture2D(gm_BaseTexture, v_vTexcoord).a <= 0.0) {
		float alpha = 0.0;
		
		//top
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x, v_vTexcoord.y + pixelSizeSt.y )).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x + pixelSizeDg.x, v_vTexcoord.y + pixelSizeDg.y )).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x - pixelSizeDg.x, v_vTexcoord.y + pixelSizeDg.y )).a);
		//right
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x + pixelSizeSt.x, v_vTexcoord.y )).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x + pixelSizeDg.x, v_vTexcoord.y + pixelSizeDg.y )).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x + pixelSizeDg.x, v_vTexcoord.y - pixelSizeDg.y )).a);
		//bottom
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x, v_vTexcoord.y - pixelSizeSt.y )).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x + pixelSizeDg.x, v_vTexcoord.y - pixelSizeDg.y )).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x - pixelSizeDg.x, v_vTexcoord.y - pixelSizeDg.y )).a);
		//left
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x - pixelSizeSt.x, v_vTexcoord.y )).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x - pixelSizeDg.x, v_vTexcoord.y + pixelSizeDg.y )).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2( v_vTexcoord.x - pixelSizeDg.x, v_vTexcoord.y - pixelSizeDg.y )).a);
		
		if(alpha > 0.0) {
			newColor = vec4(0.1,0.1,0.1,1.0);
		}
	}
	
    gl_FragColor = newColor;
}
