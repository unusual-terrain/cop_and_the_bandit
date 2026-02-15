from PIL import Image
import os
import math

def distance(c1, c2):
    # Euclidean distance between two RGB colors
    (r1, g1, b1) = c1[:3]
    (r2, g2, b2) = c2[:3]
    return math.sqrt((r1 - r2)**2 + (g1 - g2)**2 + (b1 - b2)**2)

def process_logo(input_path, output_path):
    print(f"Processing {input_path}...")
    try:
        img = Image.open(input_path)
        img = img.convert("RGBA")
        
        datas = img.getdata()
        
        # Smart Background Detection
        # Assume top-left pixel is background
        bg_color = datas[0]
        print(f"Detected background color: {bg_color}")
        
        new_data = []
        
        # Tolerance for compression artifacts or slight gradients
        tolerance = 50 
        
        for item in datas:
            # Check distance to background color
            if distance(item, bg_color) < tolerance:
                # Make transparent
                new_data.append((255, 255, 255, 0))
            else:
                # Keep original color
                new_data.append(item)

        img.putdata(new_data)
        img.save(output_path, "PNG")
        print(f"Processed logo saved to {output_path}")
        
    except Exception as e:
        print(f"Error processing logo: {e}")

if __name__ == "__main__":
    input_logo = "assets/images/logo.png"
    output_logo = "assets/images/logo_transparent.png"
    
    if os.path.exists(input_logo):
        process_logo(input_logo, output_logo)
    else:
        print(f"Error: {input_logo} not found.")
