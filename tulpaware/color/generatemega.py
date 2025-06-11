from PIL import Image, ImageDraw, ImageFont
import colorsys

# === CONFIGURATION ===
base_hex = "#3018A7"  # Base for saturation harmony
swatch_width, swatch_height = 50, 30
label_width = 100
num_shades = 9

# === COLOR FAMILY HUES ===
family_hues = {
    "red": 0,
    "orange": 30,
    "yellow": 58,
    "green": 120,
    "blue": 210,
    "violet": 270,
    "pink": 330,
    "gray": None,
    "sepia": 30,
    "turquoise": 180,
    "chartreuse": 90,
    "olive": 75,
    "indigo": 250
}

# === UTILITIES ===
def hex_to_rgb_float(hex_color):
    return tuple(int(hex_color[i:i+2], 16)/255.0 for i in (1, 3, 5))

def rgb_float_to_hex(rgb):
    return '#{:02x}{:02x}{:02x}'.format(*(int(x * 255) for x in rgb))

# === Get base saturation
base_rgb = hex_to_rgb_float(base_hex)
_, base_s, _ = colorsys.rgb_to_hsv(*base_rgb)

# === Build Palette ===
palette = {}
for family, hue in family_hues.items():
    shades = []
    for i in range(num_shades):
        t = i / (num_shades - 1)  # [0, 1]
        value = 0.1 + 0.9 * t  # from 0.05 to 0.95
        saturation = base_s * (1 - abs(t - 0.5) * 2)  # peak at middle (t=0.5)
        
        if hue is None:
            rgb = (value, value, value)
        else:
            rgb = colorsys.hsv_to_rgb(hue / 360.0, saturation, value)
        shades.append(rgb_float_to_hex(rgb))
    palette[family] = shades

# === Draw Swatch Sheet ===
rows = len(palette)
img = Image.new("RGB", ((swatch_width * num_shades) + label_width, swatch_height * rows), "white")
draw = ImageDraw.Draw(img)

try:
    font = ImageFont.truetype("DejaVuSansMono.ttf", 12)
except IOError:
    font = ImageFont.load_default()

for row_index, (name, colors) in enumerate(palette.items()):
    y = row_index * swatch_height
    draw.text((5, y + 8), name.capitalize(), fill="black", font=font)
    for col_index, hex_color in enumerate(colors):
        x = label_width + (col_index * swatch_width)
        draw.rectangle([x, y, x + swatch_width, y + swatch_height], fill=hex_color)

# Save results
img.save("harmonized_value_palette.png")
print("✅ Saved image: harmonized_value_palette.png")

# Print Markdown table
print("\n# Markdown Palette Table\n")
for name, colors in palette.items():
    print(f"## {name.capitalize()}")
    print("| # | Hex |")
    print("|---|-----|")
    for i, color in enumerate(colors, 1):
        print(f"| {i} | {color} |")
    print()
