const express = require('express');
const path = require('path');

const app = express();
const port = process.env.PORT || 8080;

// Serve static files (your existing HTML, CSS, JS)
app.use(express.static(path.join(__dirname)));

// Health check endpoint - THIS IS THE KEY!
app.get('/health', (req, res) => {
    const healthStatus = {
        status: 'healthy',
        timestamp: new Date().toISOString(),
        uptime: process.uptime(),
        memory: process.memoryUsage(),
        version: '1.0.0',
        service: 'snake-game'
    };
    
    console.log('Health check requested:', healthStatus);
    res.status(200).json(healthStatus);
});

// API endpoint to get game stats (optional - shows API skills)
app.get('/api/stats', (req, res) => {
    res.json({
        message: 'Snake Game API',
        endpoints: {
            health: '/health',
            stats: '/api/stats',
            game: '/'
        }
    });
});

// Serve the main game page
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// Handle 404s
app.use((req, res) => {
    res.status(404).json({
        error: 'Not Found',
        message: 'The requested resource was not found'
    });
});

// Start the server
app.listen(port, () => {
    console.log(`🐍 Snake Game Self-Healing Demo running on port ${port}`);
    console.log(`🏥 Health check available at /health`);
    console.log(`🎮 Game available at /`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
    console.log('SIGTERM received, shutting down gracefully');
    process.exit(0);
});

process.on('SIGINT', () => {
    console.log('SIGINT received, shutting down gracefully');
    process.exit(0);
});