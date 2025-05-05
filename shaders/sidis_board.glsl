void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord / iResolution.xy;

    float Colsinx = sin(uv.x + iTime);
    float Colsiny = sin(uv.y + iTime);
    float sinparty = sin((Colsinx * Colsiny) * iTime);
    float sinpeace = sin((Colsinx / Colsiny) * iTime);
    
    // Ensure the exponents are being applied properly
    float tanparty = pow(uv.x * uv.y, 6.0);  // Exponent of 6 for uv.x * uv.y
    float tanpeace = pow(uv.x / uv.y, 0.33);  // Exponent of 0.33 for uv.x / uv.y

    if (tan(tanparty) == tan(tanpeace))
    {
        // Output to screen
        fragColor = vec4(Colsinx, Colsiny, sinpeace, sinpeace);
    }
    else
    {
        fragColor = vec4(Colsiny, Colsinx, sinparty, sinparty);
    }
}