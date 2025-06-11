from PIL import Image, ImageDraw, ImageFont

# Define your 14-color-family megapalette (each with 9 tones)
palette = {
    "sepia":      ["#1e1914", "#403325", "#664c32", "#8f6652", "#bc7f66", "#d19982", "#e1b29d", "#efccb9", "#f8e5d9"],
    "red":        ["#1e1414", "#402525", "#663232", "#8f3c3c", "#bc4242", "#d16060", "#e18383", "#efa8a8", "#f8d2d2"],
    "orange":     ["#1e1914", "#403325", "#664c32", "#8f663c", "#bc7f42", "#d19960", "#e1b283", "#efcca8", "#f8e5d2"],
    "yellow":     ["#1e1c14", "#403c25", "#665d32", "#8f813c", "#bca842", "#d1be60", "#e1d283", "#efe3a8", "#f8f2d2"],
    "chartreuse": ["#1a1e14", "#324025", "#4b6632", "#658f3c", "#7fbc42", "#99d160", "#b2e183", "#ccefaa", "#e5f8d2"],
    "green":      ["#141e17", "#25402e", "#326643", "#3c8f58", "#42bc6b", "#60d186", "#83e1a2", "#a8efc0", "#d2f8df"],
    "turquoise":  ["#141e1e", "#254040", "#326666", "#3c8f8f", "#42bcbc", "#60d1d1", "#83e1e1", "#a8efef", "#d2f8f8"],
    "blue":       ["#14191e", "#253240", "#324c66", "#3c658f", "#427fbc", "#6098d1", "#83b2e1", "#a8cbef", "#d2e5f8"],
    "indigo":     ["#14141e", "#252540", "#323266", "#3c3c8f", "#4242bc", "#6060d1", "#8383e1", "#a8a8ef", "#d2d2f8"],
    "violet":     ["#19141e", "#322540", "#4c3266", "#653c8f", "#7f42bc", "#9860d1", "#b283e1", "#cba8ef", "#e5d2f8"],
    "pink":       ["#1e1419", "#402533", "#66324c", "#8f3c66", "#bc427f", "#d16099", "#e183b2", "#efa8cc", "#f8d2e5"],
    "gray":       ["#191919", "#333333", "#4c4c4c", "#666666", "#7f7f7f", "#999999", "#b2b2b2", "#cccccc", "#e5e5e5"]
}

# Swatch settings
swatch_width = 50
swatch_height = 30
label_width = 100
rows = len(palette)
cols = 9

# Create image
img = Image.new("RGB", ((swatch_width * cols) + label_width, swatch_height * rows), "white")
draw = ImageDraw.Draw(img)

# Load a basic font
try:
    font = ImageFont.truetype("DejaVuSansMono.ttf", 12)
except IOError:
    font = ImageFont.load_default()

# Draw palette
for row_idx, (name, colors) in enumerate(palette.items()):
    y = row_idx * swatch_height
    draw.text((5, y + 8), name.capitalize(), fill="black", font=font)
    for col_idx, hex_color in enumerate(colors):
        x = label_width + (col_idx * swatch_width)
        draw.rectangle([x, y, x + swatch_width, y + swatch_height], fill=hex_color)

# Save result
img.save("megapalette_labeled.png")
print("✅ Saved as 'megapalette_labeled.png'")
