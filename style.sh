Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::tufte_html_book')"

# if it does not work, use Rstudio to open the book_print_migrate_bookdown_commands/analytics.Rproj 

rm -rf website
cp -rf _book website
cp -r assets/envision/css website/
cp -r assets/envision/js website/
cp -r assets/envision/font website/
cp assets/pushy/css/normalize.css website/css/
cp assets/css/toc.css website/css/
cp assets/css/sourcesans.css website/css/
cp assets/css/tufte.css website/libs/tufte-css-2015.12.29/
cd website


# the following actually made menu dispear
# perl -p -i -e 's/oORLOo/<code>/g' *.html
# perl -p -i -e 's/oORROo/<\/code>/g' *.html
# perl -p -i -e 's/<div class="sourceCode"( id="cb\d{1,4}")>/<p class="sourceCode" $1>/g' *.html
# perl -p -i -e 's/<\/pre><\/div>/<\/pre><\/p>/g' *.html
perl -p -i -e 's/<h1>Cover<\/h1>/<h1><\/h1>/g' index.html
perl -p -i -e 's/Figure 1://g' index.html
perl -p -i -e 's/<h1>Epigraph<\/h1>/<h1><\/h1>/g' epigraph.html

perl -0p -i -e 's/<div id="header">.*?<\/div>//smg' index.html

#perl -0p -i -e 's/class="author".*?<\/div>//smg' index.html
#perl -p -i -e 's/<h1 class="title">Data Analytics: A Small Data Approach<\/h1>//g' index.html


cp -rf * /Users/houtaodeng/analyticsbook.github.io/

open /Users/houtaodeng/analyticsbook.github.io/index.html

cd /Users/houtaodeng/analyticsbook.github.io

git add .
git commit -m "$1"
git pull
git push