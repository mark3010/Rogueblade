//
// Simple passthrough fragment shader
//
    varying vec2 v_vTexcoord;
    varying vec4 v_vColour;
    const vec3 luma_coefficients = vec3(0.3,0.59,0.11);
    vec3 SetLum (vec3 bottom, vec3 top) {
        vec3 R = top + dot(bottom-top,luma_coefficients);
        float L = dot(R,luma_coefficients);
        float cMin = min(min(R.r,R.g),R.b);
        float cMax = max(max(R.r,R.g),R.b); 
        R = mix(R,L+(R - L)*L/(L - cMin),float(cMin < 0.0));
        R = mix(R,L+(R - L)*(1.0 - L)/(cMax - L),float(cMax > 1.0));
        return R;
    }
    void main() {
        vec4 base = texture2D( gm_BaseTexture, v_vTexcoord );
        gl_FragColor = vec4(SetLum(base.rgb,v_vColour.rgb),base.a);
    }