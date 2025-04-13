#define SPLAT_COUNT 64.0
#define LAYERS 10.0

vec4 renderSplats(vec2 fragCoord, vec2 resolution, float time) {
    vec4 color = vec4(0.0);
    vec3 glow = vec3(0.0);
    vec2 uv = fragCoord / resolution;

    for (float i = 0.0; i < SPLAT_COUNT; i++) {
        float t = i / SPLAT_COUNT;

        // Core splat properties
        vec2 pos = (vec2(cos(t*12.0 + time), sin(t*15.0 + time)) * 0.4 + 0.5) * resolution;
        float radius = 18.0 + 12.0 * sin(t * 10.0 + time);
        float radius2 = radius * radius;
        vec3 baseColor = 0.65 + 0.35 * cos(vec3(t*4.0, t*4.0 + 2.0, t*4.0 + 4.0) + time);
        float alpha = 0.4;
        float depth = 0.5 + 0.4 * sin(t * 6.0 + time);

        vec2 delta = fragCoord - pos;
        float dist2 = dot(delta, delta);
        float softness = smoothstep(radius2, 0.0, dist2);

        // Main splat blend
        float falloff = exp(-4.0 * dist2 / radius2);
        color.rgb += baseColor * alpha * falloff;
        color.a = min(1.0, color.a + alpha * falloff);

        // Volumetric Bloom: additive radial rings
        glow.r += baseColor.r * exp(-2.0 * dist2 / (radius2 * 0.8));
        glow.g += baseColor.g * exp(-2.5 * dist2 / (radius2));
        glow.b += baseColor.b * exp(-3.0 * dist2 / (radius2 * 1.2));

        // Depth haze layer
        color.rgb += baseColor * (0.03 * (1.0 - depth)) * softness;
    }

    // Final bloom tone
    vec3 finalColor = color.rgb + glow * 0.2;
    finalColor = pow(finalColor, vec3(0.92)); // subtle gamma for glow pop

    return vec4(finalColor, 1.0);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    fragColor = renderSplats(fragCoord, iResolution.xy, iTime);
}