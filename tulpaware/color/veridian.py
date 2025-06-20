# Re-generate the full megapalette using #1e9167 as the base color
# and preserve that exact color within the green row

def hex_to_rgb_float(hex_color):
    """
    Convert hex color string (e.g. "#1e9167") to a tuple of floats (r, g, b) in [0.0, 1.0]
    """
    hex_color = hex_color.lstrip("#")
    return tuple(int(hex_color[i:i+2], 16) / 255.0 for i in (0, 2, 4))

# Define target base color
base_hex = "#1e9167"
base_rgb = hex_to_rgb_float(base_hex)
hue_base, sat_base, val_base = colorsys.rgb_to_hsv(*base_rgb)
hue_base_deg = hue_base * 360.0

# Define color groups with central hues (in degrees)
color_hues = {
    "red": 0,
    "orange": 30,
    "yellow": 50,
    "sepia": 35,
    "green": hue_base_deg,  # use base color for green
    "blue": 220,
    "violet": 275,
    "pink": 320,
    "gray": None  # handled separately
}

# Create harmonized palette
def make_row(hue, include_base=False):
    row = []
    for i in range(9):
        t = i / 8
        value = 0.12 + 0.78 * t
        saturation = 0.65 + 0.35 * (1 - abs(t - 0.5) * 2)
        if hue is None:
            # Gray scale
            rgb = (value, value, value)
        else:
            rgb = colorsys.hsv_to_rgb(hue / 360.0, saturation, value)
        row.append(rgb_float_to_hex(rgb))
    
    # Replace center with original base if requested
    if include_base:
        row[4] = base_hex
    return row

# Build full palette
palette = {}
for name, hue in color_hues.items():
    palette[name] = make_row(hue, include_base=(name == "green"))

# Draw swatch
rows = len(palette)
cols = 9
swatch_width, swatch_height = 50, 50
img = Image.new("RGB", (cols * swatch_width, rows * swatch_height), "white")
draw = ImageDraw.Draw(img)

labels = list(palette.keys())
for y, name in enumerate(labels):
    for x, hex_color in enumerate(palette[name]):
        draw.rectangle(
            [x * swatch_width, y * swatch_height,
             (x + 1) * swatch_width, (y + 1) * swatch_height],
            fill=hex_color
        )

# Save and return
buffer = io.BytesIO()
img.save(buffer, format="PNG")
buffer.seek(0), palette
