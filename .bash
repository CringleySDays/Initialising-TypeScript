developmentType=$1
red="\033[0;31m"
green="\033[0;32m"
colourless="\033[0m"

if [ $developmentType = "dev" ]; then
    yarn run dev:install && yarn run dev:upgrade && yarn run dev

elif [ $developmentType = "prod" ]; then
    yarn run prod:install && yarn run prod:upgrade && yarn run build
    rm -r src, .prettierrc.js, tsconfig.json
    NODE_ENV=prod yarn run start
else 
    echo -e "${red}Invalid. ${colourless}Please use ${green}dev ${colourless} or ${green}prod."
fi
