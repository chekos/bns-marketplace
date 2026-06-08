---
name: gemini-imagegen
description: Low-level Gemini API skill for image generation. Use this skill when you need direct API control, custom resolution/aspect ratios, multi-turn refinement, or non-brand image tasks (logos, stickers, product mockups). For tacosdedatos post banners and brand-consistent illustrations, use tacosdedatos-illustrator instead—it handles creative direction and calls this skill internally.
---

# Gemini Image Generation (Nano Banana Pro)

Generate and edit images using Google's Gemini API. The environment variable `GEMINI_API_KEY` must be set.

## CRITICAL: Output Location

**Always save images to `/tmp/` with unique filenames.** This is required for Discord delivery.

```python
import uuid

# Generate unique filename to avoid collisions
filename = f"/tmp/{uuid.uuid4()}.jpg"
image.save(filename)
print(f"Image saved to: {filename}")
```

**Why `/tmp/`?**
- Required for the API to detect and serve the image
- Images saved elsewhere will NOT be delivered to Discord
- Use UUIDs to prevent filename collisions between users

## Default Model

| Model | Resolution | Best For |
|-------|------------|----------|
| `gemini-3-pro-image-preview` | 1K-4K | All image generation (default) |

**Note:** Always use this Pro model. Only use a different model if explicitly requested.

## Quick Reference

### Default Settings
- **Model:** `gemini-3-pro-image-preview`
- **Resolution:** 1K (default, options: 1K, 2K, 4K)
- **Aspect Ratio:** 1:1 (default)

### Available Aspect Ratios
`1:1`, `2:3`, `3:2`, `3:4`, `4:3`, `4:5`, `5:4`, `9:16`, `16:9`, `21:9`

### Available Resolutions
`1K` (default), `2K`, `4K`

## Core API Pattern

```python
import os
from google import genai
from google.genai import types

client = genai.Client(api_key=os.environ["GEMINI_API_KEY"])

# Basic generation (1K, 1:1 - defaults)
response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=["Your prompt here"],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
    ),
)

import uuid

for part in response.parts:
    if part.text:
        print(part.text)
    elif part.inline_data:
        image = part.as_image()
        filename = f"/tmp/{uuid.uuid4()}.jpg"
        image.save(filename)
        print(f"Image saved to: {filename}")
```

## Custom Resolution & Aspect Ratio

```python
from google.genai import types

response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=[prompt],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
        image_config=types.ImageConfig(
            aspect_ratio="16:9",  # Wide format
            image_size="2K"       # Higher resolution
        ),
    )
)
```

### Resolution Examples

```python
# 1K (default) - Fast, good for previews
image_config=types.ImageConfig(image_size="1K")

# 2K - Balanced quality/speed
image_config=types.ImageConfig(image_size="2K")

# 4K - Maximum quality, slower
image_config=types.ImageConfig(image_size="4K")
```

### Aspect Ratio Examples

```python
# Square (default)
image_config=types.ImageConfig(aspect_ratio="1:1")

# Landscape wide
image_config=types.ImageConfig(aspect_ratio="16:9")

# Ultra-wide panoramic
image_config=types.ImageConfig(aspect_ratio="21:9")

# Portrait
image_config=types.ImageConfig(aspect_ratio="9:16")

# Photo standard
image_config=types.ImageConfig(aspect_ratio="4:3")
```

## Editing Images

Pass existing images with text prompts:

```python
from PIL import Image

img = Image.open("input.png")
response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=["Add a sunset to this scene", img],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
    ),
)
```

## Multi-Turn Refinement

Use chat for iterative editing:

```python
from google.genai import types

chat = client.chats.create(
    model="gemini-3-pro-image-preview",
    config=types.GenerateContentConfig(response_modalities=['TEXT', 'IMAGE'])
)

response = chat.send_message("Create a logo for 'Acme Corp'")
# Save first image...

response = chat.send_message("Make the text bolder and add a blue gradient")
# Save refined image...
```

## Prompting Best Practices

### Photorealistic Scenes
Include camera details: lens type, lighting, angle, mood.
> "A photorealistic close-up portrait, 85mm lens, soft golden hour light, shallow depth of field"

### Stylized Art
Specify style explicitly:
> "A kawaii-style sticker of a happy red panda, bold outlines, cel-shading, white background"

### Text in Images
Be explicit about font style and placement:
> "Create a logo with text 'Daily Grind' in clean sans-serif, black and white, coffee bean motif"

### Product Mockups
Describe lighting setup and surface:
> "Studio-lit product photo on polished concrete, three-point softbox setup, 45-degree angle"

## Advanced Features

### Google Search Grounding
Generate images based on real-time data:

```python
response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=["Visualize today's weather in Tokyo as an infographic"],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
        tools=[{"google_search": {}}]
    )
)
```

### Multiple Reference Images (Up to 14)
Combine elements from multiple sources:

```python
response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=[
        "Create a group photo of these people in an office",
        Image.open("person1.png"),
        Image.open("person2.png"),
        Image.open("person3.png"),
    ],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
    ),
)
```

## Important: File Format & Media Type

**CRITICAL:** The Gemini API returns images in JPEG format by default. When saving, always use `.jpg` extension to avoid media type mismatches.

```python
import uuid

# CORRECT - Use /tmp/ with .jpg extension
filename = f"/tmp/{uuid.uuid4()}.jpg"
image.save(filename)
print(f"Image saved to: {filename}")

# WRONG - Will NOT be delivered to Discord
image.save("output.jpg")  # Not in /tmp/!
image.save("/app/image.jpg")  # Wrong directory!
```

### Converting to PNG (if needed)

If you specifically need PNG format:

```python
from PIL import Image

# Generate with Gemini
for part in response.parts:
    if part.inline_data:
        img = part.as_image()
        # Convert to PNG by saving with explicit format
        img.save("output.png", format="PNG")
```

### Verifying Image Format

Check actual format vs extension with the `file` command:

```bash
file image.png
# If output shows "JPEG image data" - rename to .jpg!
```

## Notes

- All generated images include SynthID watermarks
- Gemini returns **JPEG format by default** - always use `.jpg` extension
- Image-only mode (`responseModalities: ["IMAGE"]`) won't work with Google Search grounding
- For editing, describe changes conversationally—the model understands semantic masking
- Default to 1K resolution for speed; use 2K/4K when quality is critical