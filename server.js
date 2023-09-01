const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
    // Set the POD_NAME environment variable
    process.env.POD_NAME = "YourPodNameHere"; // Set the pod name as desired

    // Serve custom content
    const content = `
    <!DOCTYPE html>
    <html>
    <head>
        <title>Pod Name Display</title>
    </head>
    <body>
        <h1>Hello from Pod: ${process.env.HOSTNAME}</h1>
    </body>
    </html>
    `;

    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end(content);
});

server.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
