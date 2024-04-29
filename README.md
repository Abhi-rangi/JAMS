Here is an optimized version of your README file with clearer structure, step-by-step instructions, and improved readability:

---

# JAMS Project Setup Guide

## Overview
This guide provides instructions for setting up the backend and frontend components of the JAMS project, as well as connecting to the AWS RDS database.

### Prerequisites
- Node.js installed
- Access to AWS RDS

## Backend Setup
1. **Navigate to the Backend directory**:
   ```sh
   cd /Backend
   ```

2. **Install dependencies**:
   ```sh
   npm install
   ```

3. **Start the server**:
   - To start the server with automatic recompilation on file changes:
     ```sh
     nodemon server.js
     ```
   - To start the server without automatic recompilation:
     ```sh
     node server.js
     ```
   - The server will be hosted at `localhost:3001`.

4. **Run tests**:
   ```sh
   npm run test
   ```

## Frontend Setup
1. **Navigate to the Frontend directory**:
   ```sh
   cd /FrontEnd/jams
   ```

2. **Install dependencies**:
   ```sh
   npm install
   ```

3. **Start the frontend**:
   ```sh
   npm run dev
   ```
   - The frontend will be hosted at `localhost:3000`.

## Database Connection
- **AWS RDS Details**:
  - Host: `jams.ctgcq8w46uhl.us-east-2.rds.amazonaws.com`
  - Port: `3306`
  - Note: This is a 12-month free RDS instance available on AWS.

---

This revision organizes the content for better navigation and clarity, providing clear, actionable steps for each part of the setup process.