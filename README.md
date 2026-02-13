<div align="center">
<img width="1200" height="475" alt="GHBanner" src="https://github.com/user-attachments/assets/0aa67016-6eaf-458a-adb2-6e31a0763ed6" />
</div>

# FitGenius AI Coach - Personalized Diet and Fitness Coach

A web-based application providing personalized fitness and diet recommendations powered by AI.

## Project Overview

**FitGenius AI Coach** is a comprehensive fitness and nutrition management platform that uses the Gemini API to generate personalized recommendations based on user profiles and fitness goals.

### Technology Stack
- **Frontend:** React 19 with TypeScript, Vite, Recharts for visualization
- **Backend:** Node.js with Express.js
- **AI Integration:** Google Gemini API for intelligent recommendations
- **Database:** JSON-based user data management
- **Architecture:** Microservices with separated concerns for user data handling and AI-powered logic

## Features
- User authentication and profile management
- Personalized fitness plan generation
- Custom diet plans with macro tracking
- Progress monitoring with visual analytics
- Admin dashboard for user management
- Real-time recommendations based on user-specific data

## Prerequisites
- Node.js (v16+)
- npm or yarn
- Gemini API key

## Setup and Installation

1. Clone the repository and install dependencies:
   ```bash
   npm install
   ```

2. Create a `.env.local` file in the root directory:
   ```
   GEMINI_API_KEY=your_api_key_here
   VITE_API_URL=http://localhost:3001
   ```

3. Start the development environment:
   ```bash
   npm run dev        # Frontend (Vite)
   npm run server     # Backend (Node.js)
   ```

## Project Structure
- **`/components`** - React UI components
- **`/services`** - API service layer and Gemini integration
- **`/types`** - TypeScript type definitions
- **`package.json`** - Project dependencies and scripts
