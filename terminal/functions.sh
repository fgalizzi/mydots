# This file contains utility functions for various tasks.



# Function to count the number of files in a directory
nfiles() {
    if [ -z "$1" ]; then
        echo "Usage: count_files DIR_NAME"
        return 1
    fi

    if [ ! -d "$1" ]; then
        echo "Error: '$1' is not a directory."
        return 1
    fi

    ls "$1" | wc -l
}

# Open a ROOT file and a TBrowser with my custom settings
nt() {
  eval 'root $1 -e "nt()" '
}

# Open a ROOT file and a TBrowser with default settings
ntt() {
  eval 'root $1 -e "new TBrowser(\"\", \"\", 1200, 900)" '
}
