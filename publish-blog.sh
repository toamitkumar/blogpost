#!/bin/bash

# Push the content to <blogpost> repo
git add .
git commit -m "New post added..."
git push -u origin master


rm -rf ../toamitkumar.github.com
mkdir ../toamitkumar.github.com
cd ../toamitkumar.github.com

cp ../blogposts/README.md .

wget -r http://127.0.0.1:2368/
mv */* .
rm -rf 127.0.0.1:2368

wget http://127.0.0.1:2368/sitemap.xml
wget http://127.0.0.1:2368/sitemap-pages.xml
wget http://127.0.0.1:2368/sitemap-posts.xml
wget http://127.0.0.1:2368/sitemap-authors.xml
wget http://127.0.0.1:2368/sitemap-tags.xml
wget http://127.0.0.1:2368/rss

wget http://127.0.0.1:2368/favicon.png

mkdir -p assets/built
wget http://127.0.0.1:2368/assets/css/main.min.css -O assets/css/main.min.css

mkdir -p assets/js
wget http://127.0.0.1:2368/assets/js/head-scripts.min.js -O assets/js/head-scripts.min.js

mkdir -p public
wget http://127.0.0.1:2368/public/ghost-sdk.js -O public/ghost-sdk.js

LC_CTYPE=C && LANG=C && find . -type f -exec sed -i '' -- 's/http:\/\/localhost:2368/https:\/\/toamitkumar.com/g' {} +
LC_CTYPE=C && LANG=C && find . -type f -exec sed -i '' -- 's/\/\/localhost:2368/\/\/toamitkumar.com/g' {} +
LC_CTYPE=C && LANG=C && find . -type f -exec sed -i '' -- 's/rss\//rss/g' {} +

echo "toamitkumar.com" > CNAME

git init
git remote add origin git@github.com:toamitkumar/toamitkumar.github.com.git
git add .
#git commit -a -m "static content for the blogpost"

#git push -u origin master





