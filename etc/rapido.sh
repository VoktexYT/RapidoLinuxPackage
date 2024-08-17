#!/bin/bash

DATA_DIR="$HOME/.rapido"

initialize()
{
    mkdir -p "$DATA_DIR"
}

create_template_1()
{
    TEMPLATE_NAME="simple-web"
    PROJECT_PATH="$DATA_DIR/$TEMPLATE_NAME"

    mkdir -p "$PROJECT_PATH"

    echo '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rapido Template</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <p>Hello World!</p>
    <script src="./script.js"></script>
</body>
</html>' > "$PROJECT_PATH/index.html"

    echo 'h1 {
color: red;
}' > "$PROJECT_PATH/style.css"

    echo 'console.log("Hello World!");' > "$PROJECT_PATH/script.js"
}

case "$1" in
    --init)
        echo "Initializing..."
        initialize
        create_template_1
        echo "Initialization complete. Make rapido --help for more detail"
        ;;
    --import)
        if [ -z "$2" ]; then
            echo "Missing template name ; --import <name>"
        elif [ -z "$3" ]; then
            echo "Missing build path ; --import <...> <path>"
        else
            TEMPLATE_NAME="$2"
            PROJECT_PATH="$DATA_DIR/$TEMPLATE_NAME"

            if [ -d "$PROJECT_PATH" ]; then
                echo -e "\n \033[1;34m Build '$TEMPLATE_NAME' template at '$3' \033[0m\n"
                cp -r "$PROJECT_PATH" "$3"
            else
                echo "Template '$TEMPLATE_NAME' not found."
            fi
        fi
        ;;
    --save)
        if [ -z "$2" ]; then
            echo "Missing template name ; --save <name>"
        elif [ -z "$3" ]; then
            echo "Missing template path ; --save <...> <path>"
        else
            TEMPLATE_NAME="$2"
            TEMPLATE_PATH="$3"
            PROJECT_PATH="$DATA_DIR/$TEMPLATE_NAME"

            echo -e "\n \033[1;34m Save as '$TEMPLATE_NAME' template... \033[0m\n"

            # Get the current directory where the script is located
            SCRIPT_DIR="$(dirname "$(realpath "$0")")"

            mkdir -p "$PROJECT_PATH"
            cp -r "$SCRIPT_DIR/$TEMPLATE_PATH"/* "$PROJECT_PATH"

            echo -e "\n \033[1;34m The save is completed! \033[0m\n"
        fi
        ;;
    
    --list)
        echo -e "\n"
        for dir in $(ls -F "$DATA_DIR" | grep '/$' | grep -v '/\.' | sed 's:/$::'); do
            echo -e "  \033[91m$dir\033[0m\n"
        done
        echo ""
        ;;
    
    --help)
        echo -e "\nThe rapido package is used to save/import project structure easily.\n\n--- --- --- --- ---\n\nInit rapido with :\n  rapido --init\n\nImport template with :\n  rapido --import <template name> <build path>\n\nSave template with :\n   rapido --save <template name> <template path>\n\nList all template name with :\n   rapido --list\n\n"
esac
