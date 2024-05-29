#!/bin/bash

# Define the base directory (change this if your assets folder is located elsewhere)
base_dir="assets"

# Loop through each file in the assets directory and its subdirectories
find "$base_dir" -type f | while read -r filepath; do
  # Extract the relative path from the full path
  relative_path="${filepath#$base_dir/}"

  # Replace "/" with "'/" (single quotes and slash) for Flutter string literal
  formatted_path="'${relative_path//\//'\'/}'"

  # Print the formatted path
  echo "const String $relative_path = $formatted_path;"
done
