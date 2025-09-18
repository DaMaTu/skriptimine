#!/bin/bash
# See skript küsib kasutajalt kataloogi, pakib selle kokku
# ja salvestab ./backup kataloogi nimega <katalooginimi>.backup.<kuupäev>.tar.gz

read -p "Sisesta kataloogi tee, mida soovid varundada: " allikas

if [ ! -d "$allikas" ]; then
    echo "Viga: kataloogi '$allikas' ei eksisteeri!"
    exit 1
fi

siht="./backup"
[ ! -d "$siht" ] && mkdir -p "$siht"

katalooginimi=$(basename "$allikas")

# Kuupäeva formaat: 18sept2025 (päev+kuu lühend eesti keeles+aasta)
kuupaev=$(date +"%d%b%Y" | sed -E 's/Jan/jaan/; s/Feb/veebr/; s/Mar/märts/; s/Apr/apr/; s/May/mai/; s/Jun/juuni/; s/Jul/juuli/; s/Aug/aug/; s/Sep/sept/; s/Oct/okt/; s/Nov/nov/; s/Dec/dets/')

failinimi="${katalooginimi}.backup.${kuupaev}.tar.gz"

# Liigu kataloogi, kus asub allikas ja paki seal
cd "$(dirname "$allikas")"
tar -czf "$OLDPWD/$siht/$failinimi" "$katalooginimi"

# Naase eelmisse kataloogi
cd "$OLDPWD"

echo "Teostatakse kataloogi '$allikas' varundus."
echo "Varundusfaili nimi on: $failinimi"
echo "Varundus asub kataloogis: $(realpath "$siht")"
