#!/bin/sh

# script to easily update translation language files

# add new language:
# pybabel init -i messages.pot -d frozensearch/translations -l en

frozensearch_DIR='frozensearch'

pybabel extract -F babel.cfg -o messages.pot $frozensearch_DIR
for f in `ls $frozensearch_DIR'/translations/'`; do
    pybabel update -i messages.pot -d $frozensearch_DIR'/translations/' -l $f
    # TODO - need to fix category translations
    sed -i 's/#~ //' $frozensearch_DIR'/translations/'$f'/LC_MESSAGES/messages.po'
done

echo '[!] update done, edit .po files if required and run pybabel compile -d frozensearch/translations/'
