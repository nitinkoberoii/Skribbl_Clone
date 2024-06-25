const express = require("express");
var http = require("http");
const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const mongoose = require("mongoose");
const Room = require('./models/Room');
const getWord = require('./api/getWord');
var io = require("socket.io")(server);

// middleware
app.use(express.json());

// connect to our MongoDB
const DB = "mongodb+srv://Nitin:Nitin123@demoapplications.urh0ulu.mongodb.net/?retryWrites=true&w=majority&appName=DemoApplications";

mongoose.connect(DB).then(() => {
    console.log("Connection Successful!");
}).catch((e) => {
    console.log(e);
})

// Add a route for the root URL
app.get("/", (req, res) => {
    res.send("Connection successful!");
});

io.on('connection', (socket) => {
    console.log('connected');

    // create game callback
    socket.on('create-game', async({nickname, name, occupancy, maxRounds}) => {
        try {
            const existingRoom = await Room.findOne({name});
            if(existingRoom) {
                socket.emit('notCorrectGame', 'Room with that name already exists!');
                return;
            }
            let room = new Room();
            const word = getWord();
            room.word = word;
            room.name = name;
            room.occupancy = occupancy;
            room.maxRounds = maxRounds;

            let player = {
                socketID: socket.id,
                nickname,
                isPartyLeader: true,
            }
            room.players.push(player);
            room = await room.save();
            socket.join(name);
            io.to(name).emit('updateRoom', room);
        } catch (err) {
            console.log(err);
        }
    });

    // join game callback
    socket.on('join-game', async({nickname, name}) => {
        try {
            let room = await Room.findOne({name});
            if(!room) {
                socket.emit('notCorrectGame', 'Please enter a valid room name');
                return;
            }

            if(room.isJoin) {
                let player = {
                    socketID: socket.id,
                    nickname,
                }
                room.players.push(player);
                socket.join(name);

                if(room.players.length === room.occupancy) {
                    room.isJoin = false;
                }
                room.turn = room.players[room.turnIndex];
                room = await room.save();
                io.to(name).emit('updateRoom', room);
            } else {
                socket.emit('notCorrectGame', 'The game is in progress, please try later!');
            }
        } catch(err) {
            console.log(err);
        }
    })
})

server.listen(port, "0.0.0.0", () => {
    console.log("Server started and running on port " + port);
})