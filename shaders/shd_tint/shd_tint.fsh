//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 OriginalColour = texture2D( gm_BaseTexture, v_vTexcoord );
  
  
    float Red = OriginalColour.r;
    float Green = OriginalColour.g;
    float Blue = OriginalColour.b;
    float Alpha = OriginalColour.a;
  
    float buffer = 1.0;
    float lightness = ((Red + Green + Blue) / 3.0);
  
    float multiplier = 1.0 - 2.0 * abs(lightness - 0.5);
  
    multiplier = multiplier * buffer;


  
    float TargetR = 0.0;
    float TargetG = 1.0;
    float TargetB = 0.0;
  
    float RDistance = (Red - TargetR) * multiplier;
    float GDistance = (Green - TargetG) * multiplier;
    float BDistance = (Blue - TargetB) * multiplier;
  
    vec4 Color = vec4(Red - RDistance, Green - GDistance, Blue - BDistance, Alpha);
  
    gl_FragColor = Color;
}