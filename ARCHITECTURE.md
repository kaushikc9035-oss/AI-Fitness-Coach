# FitGenius AI Coach - Architecture & Implementation Guide

## Project Description

**FitGenius AI Coach** is a personalized diet and fitness coaching application that leverages AI to provide customized fitness plans and nutrition recommendations. The project demonstrates a modern full-stack architecture with clear separation of concerns.

### Key Features
- User authentication and profile management
- AI-powered personalized fitness and diet plan generation
- Progress tracking with visual analytics
- User-specific data handling and logic-based recommendations
- Admin dashboard for user management
- Responsive React-based user interface

## Tech Stack

### Frontend
- **Framework:** React 19 with TypeScript
- **Build Tool:** Vite (fast development and production builds)
- **Visualization:** Recharts (for progress charts and analytics)
- **UI Components:** Custom React components in TSX format
- **Styling:** CSS/Tailwind (as configured)

### Backend
- **Runtime:** Node.js
- **Framework:** Express.js
- **Language:** TypeScript
- **Data Persistence:** JSON file-based storage (can be replaced with MongoDB/PostgreSQL)

### AI Integration
- **API:** Google Gemini 2.5 Flash
- **Purpose:** Generate personalized fitness plans with nutritional data
- **Integration:** Backend-only for secure API key management

## Project Architecture

```
fitgenius-ai-coach/
├── components/              # React UI Components
│   ├── AdminDashboard.tsx   # Admin management interface
│   ├── DashboardHome.tsx    # Main dashboard
│   ├── InputForm.tsx        # User profile form
│   ├── Login.tsx            # Authentication
│   ├── MealPlanView.tsx     # Meal plan display
│   ├── PlanDisplay.tsx      # Generated plan display
│   ├── ProgressView.tsx     # Progress tracking
│   ├── Sidebar.tsx          # Navigation sidebar
│   └── WorkoutPlanView.tsx  # Workout plan display
│
├── services/                # Backend & API Services
│   ├── geminiService.ts     # Gemini API integration
│   └── apiService.ts        # Frontend API client
│
├── types.ts                 # TypeScript type definitions
├── server.ts                # Express backend server
├── App.tsx                  # Main React component
├── index.tsx                # React entry point
├── vite.config.ts           # Vite configuration
├── tsconfig.json            # TypeScript configuration
├── package.json             # Project dependencies
└── README.md                # Project documentation
```

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration

### User Management
- `GET /api/users/:userId` - Get user profile
- `PUT /api/users/:userId` - Update user profile

### Plans & Recommendations
- `POST /api/plans/generate` - Generate personalized fitness and diet plan

### Admin
- `GET /api/admin/users` - Get all users (admin only)

### Health Check
- `GET /api/health` - API health status

## User Data Handling

The application handles user-specific data through:

1. **Profile Management:** Stores user demographics, preferences, and goals
2. **Personalization Engine:** Uses Gemini API to analyze user data and generate custom plans
3. **Progress Tracking:** Logs weight and fitness milestones over time
4. **Data Validation:** Type-safe data handling with TypeScript interfaces

### User Profile Data
```typescript
{
  id: string;                    // Unique identifier
  email: string;                 // Login email
  name: string;                  // Full name
  age: number;                   // Age
  height: number;                // Height in cm
  weight: number;                // Current weight in kg
  gender: Gender;                // Male, Female, Other
  activityLevel: ActivityLevel;  // Sedentary to Super Active
  fitnessGoal: FitnessGoal;      // Lose Weight, Maintain, Build Muscle
  foodPreference: FoodPreference; // Vegetarian, Vegan, Keto, etc.
  healthIssues?: string;         // Any injuries or conditions
  createdAt: string;             // Account creation timestamp
  weightLogs?: WeightLog[];       // Progress history
}
```

## AI Integration Details

### Gemini API Usage
The `geminiService.ts` handles:
- Prompt engineering for fitness and nutrition recommendations
- Structured JSON response schema for consistency
- Macro-nutrient calculations (protein, carbs, fats)
- Caloric deficit/surplus calculations
- Personalized workout routines

### Generated Plan Structure
Plans include:
- **Dietary Recommendations:** Daily meal plans with nutritional breakdowns
- **Workout Schedules:** Exercise routines tailored to fitness level and goals
- **Caloric Requirements:** Based on user's activity level and goals
- **Macro Distribution:** Personalized protein/carb/fat ratios

## Getting Started

### Prerequisites
- Node.js v16+
- npm or yarn
- Google Gemini API key

### Installation

1. **Clone & Install Dependencies:**
   ```bash
   git clone <repository>
   cd fitgenius-ai-coach
   npm install
   ```

2. **Environment Setup:**
   ```bash
   cp .env.local.example .env.local
   # Edit .env.local and add your Gemini API key
   ```

3. **Running the Application:**

   **Option 1: Run Frontend & Backend Separately**
   ```bash
   # Terminal 1 - Backend
   npm run server

   # Terminal 2 - Frontend
   npm run dev
   ```

   **Option 2: Run Both Concurrently**
   ```bash
   npm start
   ```

4. **Access the Application:**
   - Frontend: http://localhost:5173
   - Backend: http://localhost:3001
   - API Health: http://localhost:3001/api/health

## Development Workflow

### Frontend Development
- Components use React hooks and TypeScript
- API calls via `apiService.ts`
- Build with `npm run build`

### Backend Development
- Express middleware for CORS and JSON parsing
- Centralized error handling
- JSON file storage (easily replaceable with database)

### Type Safety
- All services and components are fully typed with TypeScript
- Shared types in `types.ts`

## Deployment

### Build Process
```bash
npm run build       # Builds frontend (Vite)
npm run server:build # Builds backend (TypeScript)
```

### Production Considerations
1. Use a real database (MongoDB, PostgreSQL) instead of JSON files
2. Implement proper authentication (JWT tokens)
3. Add rate limiting and security headers
4. Use environment-specific configurations
5. Enable HTTPS
6. Add comprehensive error logging
7. Implement caching strategies

## Security Considerations

1. **API Key Management:** Gemini API key stored only on backend
2. **Password Storage:** Should be hashed (implement bcrypt)
3. **Authentication:** Implement JWT tokens for session management
4. **CORS:** Configured for frontend domain
5. **Input Validation:** Validate all user inputs before processing

## Future Enhancements

- Database integration (MongoDB/PostgreSQL)
- JWT-based authentication
- Real-time notifications
- Mobile app version
- Social features (friend tracking, challenges)
- Integration with fitness wearables
- Advanced analytics and reporting
- Multi-language support
- Payment integration for premium features

## Troubleshooting

**Backend won't start:**
- Ensure Node.js is installed
- Check environment variables
- Verify Gemini API key is valid

**Frontend can't connect to backend:**
- Ensure backend is running on port 3001
- Check VITE_API_URL in .env.local
- Verify CORS settings

**API calls failing:**
- Check browser console for error messages
- Verify request/response format matches API specs
- Check backend logs for detailed errors

## Contributors

- Development Team

## License

Proprietary - All Rights Reserved
