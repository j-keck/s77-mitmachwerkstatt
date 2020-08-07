#!/usr/bin/env nix-shell
#! nix-shell --pure -i bash -p "texlive.combine { inherit (texlive) scheme-small draftwatermark everypage; }" imagemagick ghostscript
#
set -e

function to_pdf() {
    path=$1
    dir=$(dirname $path)
    file=$(basename $path)

    (cd $dir; pdflatex $file)
}

function to_png() {
    path=$1
    dir=$(dirname $path)
    file=$(basename $path)
    bn=$(basename $file .pdf)

    (cd $dir; convert -quality 90 -density 500 $file $bn.png)
}


to_pdf "location/s77-mitmachwerkstatt-location.tex"
to_png "location/s77-mitmachwerkstatt-location.pdf"

to_pdf "hygienekonzept/s77-mitmachwerkstatt-reinigungsplan.tex"
to_pdf "hygienekonzept/s77-mitmachwerkstatt-hygienekonzept.tex"
