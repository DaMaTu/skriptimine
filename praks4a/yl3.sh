#!/bin/bash
# See skript pakib ./test kataloogi kokku ja salvestab ./backup alla
# nimega test.backup.tar.gz

allikas="./test"
siht="./backup"
failinimi="test.backup.tar.gz"

if [ ! -d "$allikas" ]; then
    echo "Viga: kataloogi '$allikas' ei eksisteeri!"
    exit 1
fi

if [ ! -d "$siht" ]; then
    mkdir -p "$siht"
fi

tar -czf "$siht/$failinimi" "$allikas"

# Selgitav väljund – kõik ühes reas
echo "Kataloogi $(realpath $allikas) backup_i nimi on $failinimi ja ta asub $(realpath $siht) kataloogis."
