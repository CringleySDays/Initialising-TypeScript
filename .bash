developmentType=$1
developmentArg=$2

red="\033[0;31m"
green="\033[0;32m"
colourless="\033[0m"

if [ [$developmentArg != "install"] ] && [ [$developmentArg != "upgrade"] ] && [ [$developmentArg != "dev"] ] && [ [$developmentArg != "prod"] ]; then
    echo -e "${red}Invalid. ${colourless}Please use ${green}install${colourless}, ${green}upgrade${colourless}, ${green}dev ${colourless}or ${green}prod."
    exit 0
fi

if [ $developmentType = "dev" ]; then
    if [ $developmentArg = "install" ]; then
        bun run dev:install
    
    elif [ $developmentArg = "upgrade" ]; then
        bun run dev:upgrade
    fi

    bun run dev
    

elif [ $developmentType = "prod" ]; then
    if [ $developmentArg = "install" ]; then
        bun run uninstall && bun run prod:install
    
    elif [ $developmentArg = "upgrade" ]; then
        bun run prod:upgrade
    fi

    bun run build
    rm - src/ && rm -r .prettierrc.js && rm -r tsconfig.json
    bun run prod

else 
    echo -e "${red}Invalid. ${colourless}Please use ${green}dev ${colourless} or ${green}prod."
fi
