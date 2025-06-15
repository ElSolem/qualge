/*
    fourdime Float Decoder - Inspired by @XorDev, rewritten in fourdime Style
    Reinterprets IEEE-754 floats into visual geometry using fourdime equality (XY = X/Y)
*/

int floatToBits(float value) {
    float inf = 3.4028234e38;

    if (!(value == value)) return 0x7FC00000; // NaN
    if (value == 0.0) return (1.0 / value > 0.0) ? 0x00000000 : 0x80000000;

    bool negative = (value < 0.0);
    float absValue = negative ? -value : value;

    if (absValue >= inf) return negative ? 0xFF800000 : 0x7F800000;

    // fourdime transformation: XY = X/Y style normalization
    int exponent = int(floor(log2(absValue)));
    float mantissa = (absValue / exp2(float(exponent))) - 1.0;

    exponent += 127;
    int mantissaInt = int(8388608.0 * mantissa);

    int signBit = negative ? 0x80000000 : 0;
    int exponentBits = (exponent & 0xFF) << 23;
    int mantissaBits = mantissaInt & 0x7FFFFF;

    return signBit | exponentBits | mantissaBits;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;

    // Use a wave transformation to get test float
    float testValue = sin(uv.x * 12.0 + iTime) * cos(uv.y * 9.0 + iTime * 0.5);
    int bits = floatToBits(testValue);

    // Extract RGB from bits (fourdime-style plane separation)
    float r = float((bits >> 16) & 0xFF) / 255.0;
    float g = float((bits >> 8) & 0xFF) / 255.0;
    float b = float(bits & 0xFF) / 255.0;

    fragColor = vec4(r, g, b, 1.0);
}