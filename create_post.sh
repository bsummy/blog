#!/bin/bash

# Generate the template for a new blog post
# Just load the pictures, and write the text.

# Define the template directory path from music directory
template_dir="assets/posts/template"
echo $template_dir

# Prompt the user for the blog post title
read -p "Enter the blog post title: " post_title

# Create the blog post directory from music directory
post_dir="assets/posts/$post_title"
mkdir -p "$post_dir"

# Copy the template files to the blog post directory
cp -R "$template_dir/." "$post_dir"


echo "Blog post files and folders created successfully."
