#!/usr/bin/python

import requests
import pytesseract
from PIL import Image
from io import BytesIO
import argparse
import openai  # Assuming OpenAI API for AI enhancement
import os

# Flag to enable AI-based OCR enhancement
USE_AI = False  # Set to True to enable AI

# Read OpenAI API Key from environment variables
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

def get_captcha_text(captcha_url):
    try:
        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        }
        
        # Fetch the CAPTCHA image
        response = requests.get(captcha_url, headers=headers, timeout=10)
        response.raise_for_status()
        
        # Open the image
        img = Image.open(BytesIO(response.content))
        # img.show()  # Display the image (optional)
        
        # Use Tesseract OCR to read the text
        captcha_text = pytesseract.image_to_string(img, config='--psm 7').strip()
        
        if USE_AI and OPENAI_API_KEY:
            captcha_text = enhance_with_ai(captcha_text)
        
        return captcha_text
    except requests.RequestException as e:
        print(f"Error fetching CAPTCHA: {e}")
        return None
    except Exception as e:
        print(f"Error processing CAPTCHA: {e}")
        return None

def enhance_with_ai(text):
    """Use AI to refine OCR results using the latest OpenAI API."""
    try:
        client = openai.OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
        response = client.chat.completions.create(
            model="gpt-4-turbo",
            messages=[
                {"role": "system", "content": "You are an OCR text correction assistant."},
                {"role": "user", "content": f"Correct this CAPTCHA text: {text}"}
            ]
        )
        return response.choices[0].message.content.strip()
    except Exception as e:
        print(f"Error enhancing with AI: {e}")
        return text  # Return original if AI fails

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Extract text from a CAPTCHA image URL.")
    parser.add_argument("url", type=str, help="URL of the CAPTCHA image")
    args = parser.parse_args()
    
    text = get_captcha_text(args.url)
    print(f"Extracted CAPTCHA Text: {text}")
