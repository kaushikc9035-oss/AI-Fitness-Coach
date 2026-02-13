import express from 'express';
import cors from 'cors';
import { generateFitnessPlan } from './services/geminiService';
import { UserProfile } from './types';
import * as fs from 'fs';
import * as path from 'path';

const app = express();
const PORT = process.env.PORT || 3001;

// Middleware
app.use(cors());
app.use(express.json());

// In-memory user store (in production, use a database)
const usersFile = path.join(process.cwd(), 'users.json');

interface StoredUser extends UserProfile {
  password?: string;
}

const loadUsers = (): StoredUser[] => {
  if (fs.existsSync(usersFile)) {
    const data = fs.readFileSync(usersFile, 'utf-8');
    return JSON.parse(data);
  }
  return [];
};

const saveUsers = (users: StoredUser[]): void => {
  fs.writeFileSync(usersFile, JSON.stringify(users, null, 2));
};

// Authentication endpoint
app.post('/api/auth/login', (req, res) => {
  const { email, password } = req.body;
  const users = loadUsers();
  
  const user = users.find(u => u.email === email && u.password === password);
  
  if (user) {
    const { password, ...userWithoutPassword } = user;
    res.json({ success: true, user: userWithoutPassword });
  } else {
    res.status(401).json({ success: false, message: 'Invalid credentials' });
  }
});

// Register endpoint
app.post('/api/auth/register', (req, res) => {
  const newUser: StoredUser = req.body;
  const users = loadUsers();
  
  if (users.find(u => u.email === newUser.email)) {
    return res.status(400).json({ success: false, message: 'User already exists' });
  }
  
  newUser.id = Date.now().toString();
  newUser.createdAt = new Date().toISOString();
  users.push(newUser);
  saveUsers(users);
  
  const { password, ...userWithoutPassword } = newUser;
  res.json({ success: true, user: userWithoutPassword });
});

// Get user profile endpoint
app.get('/api/users/:userId', (req, res) => {
  const users = loadUsers();
  const user = users.find(u => u.id === req.params.userId);
  
  if (user) {
    const { password, ...userWithoutPassword } = user;
    res.json(userWithoutPassword);
  } else {
    res.status(404).json({ message: 'User not found' });
  }
});

// Update user profile endpoint
app.put('/api/users/:userId', (req, res) => {
  const users = loadUsers();
  const index = users.findIndex(u => u.id === req.params.userId);
  
  if (index !== -1) {
    users[index] = { ...users[index], ...req.body };
    saveUsers(users);
    const { password, ...userWithoutPassword } = users[index];
    res.json(userWithoutPassword);
  } else {
    res.status(404).json({ message: 'User not found' });
  }
});

// Generate fitness plan endpoint
app.post('/api/plans/generate', async (req, res) => {
  try {
    const userProfile: UserProfile = req.body;
    const plan = await generateFitnessPlan(userProfile);
    
    // Update user with new plan
    const users = loadUsers();
    const userIndex = users.findIndex(u => u.id === userProfile.id);
    
    if (userIndex !== -1) {
      users[userIndex].weightLogs = users[userIndex].weightLogs || [];
      saveUsers(users);
    }
    
    res.json({ success: true, plan });
  } catch (error) {
    console.error('Error generating plan:', error);
    res.status(500).json({ success: false, message: 'Failed to generate plan' });
  }
});

// Get all users (admin endpoint)
app.get('/api/admin/users', (req, res) => {
  const users = loadUsers();
  const usersWithoutPasswords = users.map(({ password, ...user }) => user);
  res.json(usersWithoutPasswords);
});

// Health check endpoint
app.get('/api/health', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

app.listen(PORT, () => {
  console.log(`🚀 FitGenius Backend Server running on http://localhost:${PORT}`);
  console.log(`📊 API documentation available at http://localhost:${PORT}/api/health`);
});
