# Skribbl_Clone

A full-stack Skribbl.io clone developed as a learning project, demonstrating real-time communication using WebSockets (Socket.IO) with a Flutter frontend and a Node.js/Express/Mongoose backend. This project replicates the core mechanics of the popular word-guessing drawing game.

## Table of Contents

*   [About The Project](#about-the-project)
*   [Features](#features)
*   [Technologies Used](#technologies-used)
*   [Prerequisites](#prerequisites)
*   [Installation](#installation)
    *   [Backend Server Setup](#backend-server-setup)
    *   [Frontend App Setup](#frontend-app-setup)
*   [Usage](#usage)
*   [Project Structure](#project-structure)

## About The Project

This project is a functional clone of the popular online game Skribbl.io, where players draw and guess words in real-time. It was developed as a hands-on learning experience in full-stack application development, focusing on integrating a Flutter client with a Node.js backend using WebSockets for real-time interactions. The application showcases how to build interactive, multi-user experiences from scratch.

## Features

*   **Real-time Drawing:** Players can draw on a shared canvas in real-time.
*   **Word Guessing:** Players can guess the hidden word.
*   **Score Tracking:** Basic scoring for correct guesses.
*   **Room-based Gameplay:** Support for multiple game rooms.
*   **Player List:** Displays active players in a room.
*   **Chat System:** In-game chat for communication.

## Technologies Used

This project leverages a modern full-stack architecture:

**Frontend:**
*   **Flutter:** UI framework for cross-platform mobile, web, and desktop applications.
*   **Dart:** Programming language for Flutter.
*   **`socket_io_client`:** Dart package for WebSocket communication with Socket.IO servers.

**Backend:**
*   **Node.js:** JavaScript runtime for server-side logic.
*   **Express.js:** Web framework for Node.js, used for API routing.
*   **Socket.IO:** Real-time bidirectional event-based communication library.
*   **Mongoose:** ODM (Object Data Modeling) for MongoDB, used for database interactions.
*   **MongoDB:** NoSQL database for storing game data.

**Other:**
*   `axios` (NPM): Promise-based HTTP client for the browser and node.js.
*   `http` (NPM): Node.js built-in HTTP module.

## Prerequisites

Before setting up the project, ensure you have the following installed:

*   **Node.js & npm:**
    *   [Download Node.js](https://nodejs.org/en/download/) (includes npm)
*   **Flutter SDK:**
    *   [Install Flutter](https://flutter.dev/docs/get-started/install)
*   **MongoDB:**
    *   [Install MongoDB](https://docs.mongodb.com/manual/installation/) (or use a cloud-hosted service like MongoDB Atlas)

## Installation

Follow these steps to get the Skribbl Clone up and running on your local machine.

### Backend Server Setup

1.  **Navigate to the server directory:**
    ```bash
    cd server
    ```
2.  **Install Node.js dependencies:**
    ```bash
    npm install
    ```
    *   **Important Note on Socket.IO Version:** There is a known compatibility issue between `socket_io_client` (Dart) and newer versions of `socket.io` (Node.js). You might need to downgrade `socket.io` to version `2.3.0` for the project to function correctly.
        If you encounter issues, run:
        ```bash
        npm uninstall socket.io
        npm install socket.io@2.3.0
        ```
3.  **Start the server:**
    ```bash
    npm start
    ```
    The server will typically run on `http://localhost:3000`.

### Frontend App Setup

1.  **Navigate back to the project root and then to the Flutter project directory:**
    ```bash
    cd .. # if you are in the server directory
    # You should be in the root directory where pubspec.yaml is located
    ```
2.  **Get Flutter dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the Flutter application:**
    Ensure your server is running (`npm start` in the `server` directory) before launching the Flutter app.
    ```bash
    flutter run
    ```
    Choose your preferred device (e.g., Chrome for web, an Android emulator, or iOS simulator).

## Usage

Once both the backend server and the Flutter frontend are running:

1.  **Launch the Flutter application.**
2.  The app will connect to your local server (defaulting to `http://localhost:3000`).
3.  You can then create a new game room or join an existing one.
4.  Invite friends to join the same room to start playing!

## Project Structure

The repository is divided into two main parts:

*   `server/`: Contains the Node.js backend application.
    *   Handles API requests, WebSocket connections, and database interactions.
*   `lib/`: Contains the Dart/Flutter frontend application.
    *   Manages the user interface, drawing canvas, and real-time communication with the backend.

Other standard Flutter directories like `android/`, `ios/`, `web/`, etc., are also present for platform-specific builds.
