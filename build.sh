git clean -fX

if [ -z $TAG ];
then
TAG="$(date +"%Y.%m.%d.%H.%M.%S")";
OUTPUT="sample";
fi

sed -i "s/VERSION/v$TAG/" chapters/cover.tex
pdflatex -synctex=1 -interaction=nonstopmode -output-directory=. -jobname="$OUTPUT" main.tex
# run build twice because of latex compilation process
# after first run TOC is empty
pdflatex -synctex=1 -interaction=nonstopmode -output-directory=. -jobname="$OUTPUT" main.tex
sed -i "s/v$TAG/VERSION/" chapters/cover.tex

# git clean -fX