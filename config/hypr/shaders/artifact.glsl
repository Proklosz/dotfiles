#version 300 es
precision mediump float;

in vec2 v_texcoord;
layout(location = 0) out vec4 fragColor;

uniform sampler2D tex;           // Hyprland screen texture
uniform sampler2D offset_image;  // Grayscale distortion map (unsupported in Hyprland currently)

void main() {
    vec2 uv = v_texcoord;

    float strength = 0.5;        // How much RGB split
    float blendFactor = 1.0;     // 0.0 = original, 1.0 = full effect

    // Sample distortion map (if supported)
    float shift = strength * texture(offset_image, uv).r / 100.0;

    // Distorted RGB split
    float r = texture(tex, vec2(uv.x + shift, uv.y)).r;
    float g = texture(tex, uv).g;
    float b = texture(tex, vec2(uv.x - shift, uv.y)).b;

    vec4 distortedColor = vec4(r, g, b, 1.0);
    vec4 originalColor  = texture(tex, uv);

    // Blend the two (50/50 by default)
    fragColor = mix(originalColor, distortedColor, blendFactor);
}

