#!bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'Please pass in an absolute path'
    exit 0
fi

PDF_COUNT=$(find $1 -name *.pdf | wc -l)
DOC_COUNT=$(find $1 -name *.doc | wc -l)
DOCX_COUNT=$(find $1 -name *.docx | wc -l)
PPT_COUNT=$(find $1 -name *.ppt | wc -l)
PPTX_COUNT=$(find $1 -name *.pptx | wc -l)
ALL_FILES=$(find $1 -type f | wc -l)
TOTAL_VALID_FILES=$(($PDF_COUNT+$DOC_COUNT+$DOCX_COUNT+$PPT_COUNT+$PPTX_COUNT))
TOTAL_INVALID_FILES=$(($ALL_FILES-$TOTAL_VALID_FILES))

echo '-----------------------------------------------'
echo 'Results'
echo '-----------------------------------------------'
echo "Total pdf:     $PDF_COUNT"
echo "Total doc:     $DOC_COUNT"
echo "Total docx:    $DOCX_COUNT"
echo "Total ppt:     $PPT_COUNT"
echo "Total pptx:    $PPTX_COUNT"
echo '-----------------------------------------------'
echo "Total files:    $ALL_FILES"
echo "Total valid files:    $TOTAL_VALID_FILES"
echo "Total invalid files:  $TOTAL_INVALID_FILES"
echo '-----------------------------------------------'
