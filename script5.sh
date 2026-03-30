#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Note: You can create an alias for this script by adding: alias manifesto='./script5.sh' to your .bashrc

echo "Answer three questions to generate your manifesto."
echo ""
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"

# Compose paragraph and write to file
echo "My Open Source Manifesto - $DATE" > $OUTPUT
echo "Every single day, I rely on tools like $TOOL to learn and build. To me, open source is the ultimate expression of $FREEDOM in the digital age. It means no one can lock away the foundations of our technology. If I had the time and resources, I would love to build $BUILD and release it under an open license, paying forward the collaborative spirit that built the internet." >> $OUTPUT

echo "-----------------------------------"
echo "Manifesto saved to $OUTPUT"
echo "-----------------------------------"
cat $OUTPUT
