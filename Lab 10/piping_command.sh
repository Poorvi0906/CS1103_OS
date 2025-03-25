#!/bin/bash
# Shell Script for Piping Commands
# Usage: ./piping_commands.sh
# Function to display the contents of the current directory
list_directory_contents() {
echo "Listing contents of the current directory:"
ls -l
echo ""
}
# Function to filter and sort directory contents
filter_and_sort_contents() {
read -p "Enter a pattern to filter files (e.g., .txt for text files): " pattern
echo "Filtering and sorting files with pattern '$pattern'..."
# Use ls, grep, and sort in a pipeline
ls -l | grep "$pattern" | sort
echo ""
}
# Function to search for a file or folder
search_the_contents() {
    read -p "Enter the name of the file or folder to search: " filename
    if ls | grep -q "$filename"; then
        echo "'$filename' found in the directory."
    else
        echo "'$filename' not found in the directory."
    fi
    echo ""
}
count_files_and_directories() {
    echo "Number of files: $(ls -l | grep -c "^-")"
    echo "Number of directories: $(($(ls -l | grep -c "^d") - 1))"
    echo "Number of executable shell scripts: $(ls -l *.sh 2>/dev/null | grep -c '^-..x')"
}

# Main menu for user interaction
echo "Piping Commands Manager"
echo "1. List contents of the current directory"
echo "2. Filter and sort directory contents"
echo "3. Search file/folder"
echo "4. count how many directories or files exists"
echo "5. Exit"
# Loop until the user chooses to exit
while true; do
read -p "Select an option (1-5): " option
case $option in
1) # List directory contents
list_directory_contents
;;
2) # Filter and sort directory contents
filter_and_sort_contents
;;
3) # Search if the file/folder exists
search_the_contents
;;
4) #Count how many files/Directories exists
count_files_and_directories
;;
5)  # Exit the script
echo "Exiting the Piping Commands Manager. Goodbye!"
exit 0
;;
*) # Invalid option
echo "Invalid option. Please select 1-4."
;;
esac
echo "" # Print a newline for better readability
done
