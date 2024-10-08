import argparse
import json
import re

def markdown_escape(text):
    # List of Markdown special characters to escape
    special_chars = r'([\*\_\{\}\[\]\(\)\#\+\-\.\!\|>])'
    
    # Use regex to add a backslash before each special character
    return re.sub(special_chars, r'\\\1', text)

# Set up argument parsing
parser = argparse.ArgumentParser(description="Convert a CSV list to a Markdown table.")
parser.add_argument('file', type=str, help='Path to the file containing the CSV data')

# Parse arguments
args = parser.parse_args()

# Open and read the file
with open(args.file, "r") as file:
    lines = file.readlines()

output = []

# Append the Markdown table header
output.append("| Timestamp | Step | Rule | Output | Priority |")
output.append("|-----------|------|------|--------|----------|")

for line in lines:
    try:
        obj = json.loads(line)
    except:
        print(f"Error parsing JSON: {line}")
        print("Exiting ...")
        exit(1)

    # Append formatted Markdown row
    timestamp = obj["time"]
    rule = obj["rule"]
    out = markdown_escape(obj["output"])
    priority = obj["priority"]
    output.append(f"| {timestamp} | test | {rule} | {out} | {priority} | ")

for line in output:
    print(line)