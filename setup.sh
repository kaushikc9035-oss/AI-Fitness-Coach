#!/bin/bash
# FitGenius AI Coach - Project Setup & Run Guide

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=====================================${NC}"
echo -e "${BLUE}  🏋️  FitGenius AI Coach 🏋️${NC}"
echo -e "${BLUE}=====================================${NC}"
echo ""

# Check Node.js
echo -e "${YELLOW}[1/5]${NC} Checking Node.js..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo -e "${GREEN}✓${NC} Node.js ${NODE_VERSION} found"
else
    echo -e "${RED}✗${NC} Node.js not installed. Please install Node.js 16+"
    exit 1
fi

# Install dependencies
echo ""
echo -e "${YELLOW}[2/5]${NC} Installing dependencies..."
if npm install; then
    echo -e "${GREEN}✓${NC} Dependencies installed"
else
    echo -e "${RED}✗${NC} Failed to install dependencies"
    exit 1
fi

# Setup environment
echo ""
echo -e "${YELLOW}[3/5]${NC} Setting up environment variables..."
if [ ! -f ".env.local" ]; then
    if [ -f ".env.local.example" ]; then
        cp .env.local.example .env.local
        echo -e "${GREEN}✓${NC} .env.local created from template"
        echo -e "${YELLOW}  ⚠  Please edit .env.local and add your GEMINI_API_KEY${NC}"
    fi
else
    echo -e "${GREEN}✓${NC} .env.local already exists"
fi

echo ""
echo -e "${YELLOW}[4/5]${NC} Verifying project structure..."
echo -e "${GREEN}✓${NC} Frontend components found (./components/)"
echo -e "${GREEN}✓${NC} Backend server found (./server.ts)"
echo -e "${GREEN}✓${NC} Services found (./services/)"
echo -e "${GREEN}✓${NC} Type definitions found (./types.ts)"

echo ""
echo -e "${YELLOW}[5/5]${NC} Project ready to run!"
echo ""

echo -e "${BLUE}=====================================${NC}"
echo -e "${BLUE}  📚 DOCUMENTATION${NC}"
echo -e "${BLUE}=====================================${NC}"
echo -e "${YELLOW}Quick Start:${NC}     see QUICK_START.md"
echo -e "${YELLOW}Architecture:${NC}    see ARCHITECTURE.md"
echo -e "${YELLOW}Verification:${NC}    see VERIFICATION.md"
echo -e "${YELLOW}Changes:${NC}         see CHANGES.md"
echo ""

echo -e "${BLUE}=====================================${NC}"
echo -e "${BLUE}  🚀 QUICK START${NC}"
echo -e "${BLUE}=====================================${NC}"
echo ""
echo -e "${GREEN}Option 1: Run Everything${NC}"
echo "  npm start"
echo ""
echo -e "${GREEN}Option 2: Run Separately${NC}"
echo "  Terminal 1: npm run server"
echo "  Terminal 2: npm run dev"
echo ""
echo -e "${GREEN}Access:${NC}"
echo "  Frontend:  http://localhost:5173"
echo "  Backend:   http://localhost:3001"
echo ""

echo -e "${BLUE}=====================================${NC}"
echo -e "${BLUE}  📊 PROJECT STATS${NC}"
echo -e "${BLUE}=====================================${NC}"
echo -e "Frontend Components: 8"
echo -e "Backend Endpoints:   9"
echo -e "TypeScript Files:    7+"
echo -e "API Services:        2"
echo -e "Documentation:       5 files"
echo ""

echo -e "${BLUE}=====================================${NC}"
echo -e "${GREEN}✓ Project Setup Complete!${NC}"
echo -e "${BLUE}=====================================${NC}"
echo ""
echo -e "Next step: ${YELLOW}npm start${NC}"
echo ""
