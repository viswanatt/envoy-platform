const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date() });
});

// Info endpoint
app.get('/api/info', (req, res) => {
  res.json({
    service: 'Envoy API',
    version: '1.0.0',
    environment: process.env.NODE_ENV || 'development',
    hostname: require('os').hostname(),
  });
});

app.listen(port, () => {
  console.log(`Envoy API listening on port ${port}`);
});
