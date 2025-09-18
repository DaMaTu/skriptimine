#!/bin/bash
#Skrip küsib kasutaja nime ning tervitab teda. Lisaks küsib sünniaasta ja arvutab vanuse.

#Küsib nime

read -p "Siesta oma nimi: " nimi
echo "Tere tulemast, $nimi!"

#Küsib sünniaasta

read -p "Sisesta oma sünniaasta: " synniaasta

#Leiab praeguse aasta

praegune_aasta=$(date +%Y)

#Arvutab vanuse

vanus=$((praegune_aasta - synniaasta))

#Edastab koos nimega tema vanuse

echo "$nimi, sina oled $vanus aasta vana."
