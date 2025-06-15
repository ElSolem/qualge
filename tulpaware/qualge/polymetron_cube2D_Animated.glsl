void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates, centered at (0,0)
    vec2 uv = fragCoord.xy / iResolution.xy;
    uv = uv * 20.0 - 10.0;  // Scale and center grid space

    float t = iTime;

    // Core Desmos patterns converted to GLSL
    float baseGrid = step(abs(mod(uv.x, 2.0) - 1.0), 0.2) * step(abs(mod(uv.y, 2.0) - 1.0), 0.2);

    float diagCross = step(abs(mod(uv.x + uv.y, 2.0) - 1.0), 0.2) * step(abs(mod(uv.x - uv.y, 2.0) - 1.0), 0.2);

    float bigDiags = step(abs(mod(uv.x + uv.y, 4.0) - 2.0), 0.2) + step(abs(mod(uv.x - uv.y, 4.0) - 2.0), 0.2);

    float centerPulse = step(abs(mod(uv.x, 4.0) - 2.0), 0.2) * step(abs(mod(uv.y, 4.0) - 2.0), 0.2);

    float throneCross = step(abs(uv.x), 0.2) + step(abs(uv.y), 0.2);

    // Combine layers with weighted brightness
    float pattern = 
        0.4 * baseGrid +
        0.3 * diagCross +
        0.2 * bigDiags +
        0.5 * centerPulse +
        0.6 * throneCross;

    // Animate slight pulsing
    pattern *= 0.8 + 0.2 * sin(t * 2.0);

    // Final color style (plasma/fourdime tone)
    vec3 color = vec3(0.1, 0.0, 0.2) + pattern * vec3(1.2, 0.7, 0.4);

    fragColor = vec4(color, 1.0);
}
