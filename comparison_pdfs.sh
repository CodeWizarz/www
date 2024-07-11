#!/bin/bash
set -e
filename=$1
pdffilename=$2
pdffilename=${pdffilename/.html/.pdf}

echo "👉  Generating PDF for $filename..."

pdf_gen() {
  if [[ $1 -le 1 ]]
  then
    echo "❌ PDF $pdffilename was generated with errors!"
  else
    wkhtmltopdf --page-size Letter --margin-left 0 --margin-right 0 --margin-top 0 --javascript-delay 2000 $filename $pdffilename > pdf_gen_stderr.log 2>&1
    if grep "Warning" pdf_gen_stderr.log
    then
      echo "Retrying PDF generation"
      pdf_gen $1-1
    fi
  fi
}

pdf_gen 5

echo "✅  PDF $pdffilename generated!"
