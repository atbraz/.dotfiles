#!/bin/sh

# Ensure scripts directory exists
mkdir -p scripts

# Create .gitattributes in the root directory if it doesn't exist
if [ ! -f .gitattributes ]; then
    echo "* filter=substitution" > .gitattributes
    echo "Created .gitattributes"
else
    echo ".gitattributes already exists"
fi

# Create clean script if it doesn't exist
if [ ! -f scripts/clean.sh ]; then
    cat > scripts/clean.sh << 'EOL'
#!/bin/sh

sed -e "s|$HOME|%%HOME%%|g" \
    -e "s|$(git config user.name)||g" \
    -e "s|$(git config user.email)||g"
EOL
    chmod +x scripts/clean.sh
    echo "Created clean.sh"
else
    echo "clean.sh already exists"
fi

# Create smudge script if it doesn't exist
if [ ! -f scripts/smudge.sh ]; then
    cat > scripts/smudge.sh << 'EOL'
#!/bin/sh

sed -e "s|/home/antonio|$HOME|g" \
    -e "s||$(git config user.name)|g" \
    -e "s||$(git config user.email)|g"
EOL
    chmod +x scripts/smudge.sh
    echo "Created smudge.sh"
else
    echo "smudge.sh already exists"
fi

# Configure Git to use these scripts
git config --local filter.substitution.clean "scripts/clean.sh"
git config --local filter.substitution.smudge "scripts/smudge.sh"

echo "Smudge and clean filters have been set up successfully."
