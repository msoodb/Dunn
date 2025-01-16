#!/usr/bin/env python3

import argparse

def generate_pattern(length):
    pattern = ""
    for i in range(length // 4):
        pattern += chr(65 + (i % 26)) * 4  # Repeat 'A'-'Z' in blocks of 4
    return pattern[:length]

# Main function to handle user input
if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate a repeating pattern of letters (e.g., AAAABBBBCCCC)."
    )
    parser.add_argument(
        "-l", "--length", 
        type=int, 
        default=128, 
        help="Length of the pattern to generate. Default is 128."
    )
    args = parser.parse_args()

    # Generate and print the pattern
    pattern = generate_pattern(args.length)
    print(pattern)

