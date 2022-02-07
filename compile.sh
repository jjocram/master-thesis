#!/bin/sh

DIR="."	
NAME="thesis"

if [ ! -d $DIR ];
  then
    mkdir $DIR;
fi

echo --------------------
echo - Initialization -
echo --------------------

pdflatex -output-directory=$DIR $NAME
biber $DIR/$NAME
makeindex -s ./$NAME.ist -t ./$NAME.glg -o ./$NAME.gls ./$NAME.glo
makeindex -s ./$NAME.ist -t ./$NAME.alg -o ./$NAME.acr ./$NAME.acn

pdflatex -output-directory=$DIR $NAME
biber $DIR/$NAME
makeindex -s ./$NAME.ist -t ./$NAME.glg -o ./$NAME.gls ./$NAME.glo
makeindex -s ./$NAME.ist -t ./$NAME.alg -o ./$NAME.acr ./$NAME.acn

echo -------------------------
echo - Creating the document -
echo -------------------------

pdflatex -output-directory=$DIR $NAME
pdflatex -output-directory=$DIR $NAME

echo ---------------------------------
echo -           Cleaning            -
echo ---------------------------------

rm $DIR/*.acn $DIR/*.aux $DIR/*.bbl $DIR/*.bcf $DIR/*.glo
rm $DIR/*.ist $DIR/*.lof $DIR/*.lot $DIR/*.run.xml $DIR/*.toc
rm $DIR/*.blg  $DIR/*.log

open $DIR/$NAME.pdf
#mv $DIR/$NAME.pdf $DIR/Ferrati_Marco.pdf

echo ---------------------------- END -----------------------------

