#!/bin/sh

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print messages with colors
echo -e "${YELLOW}Setting up Pre-commit Quality check...${NC}"

# Process indicator with countdown for 30 seconds
for i in $(seq 10 -1 1); do
  echo -ne "${YELLOW}Setting up Pre-commit Quality check... $i seconds remaining.\033[0K\r"
  sleep 1
done

git config core.hooksPath .githooks
echo -e "${GREEN}Pre-commit Quality check set up successfully.${NC}"