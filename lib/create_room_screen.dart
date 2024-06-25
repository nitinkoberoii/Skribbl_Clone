import 'package:flutter/material.dart';
import 'package:scribbl_clone/paint_screen.dart';
import 'package:scribbl_clone/widgets/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();
  late String? _maxRoundsValue;
  late String? _maxRoomSizeValue;

  void createRoom() {
    if (_nameController.text.isNotEmpty &&
        _roomNameController.text.isNotEmpty &&
        _maxRoundsValue != null &&
        _maxRoomSizeValue != null) {
      Map<String, String> data = {
        'nickname': _nameController.text,
        'name': _roomNameController.text,
        'occupancy': _maxRoomSizeValue!,
        'maxRounds': _maxRoundsValue!,
      };
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (builder) => PaintScreen(
                  data: data,
                  screenFrom: 'createRoom',
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Create Room",
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _nameController,
              hintText: "Enter your Name",
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _roomNameController,
              hintText: "Enter Room Name",
            ),
          ),
          const SizedBox(height: 20),
          DropdownButton(
            items: <String>["2", "5", "10", "15", "20"]
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                )
                .toList(),
            onChanged: (String? value) {
              setState(() {
                _maxRoundsValue = value;
              });
            },
            focusColor: const Color(0xffF5F6FA),
            hint: const Text(
              "Select Max Rounds",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          DropdownButton(
            items: <String>["2", "3", "4", "5", "6", "7", "8", "9", "10"]
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                )
                .toList(),
            onChanged: (String? value) {
              setState(() {
                _maxRoomSizeValue = value;
              });
            },
            focusColor: const Color(0xffF5F6FA),
            hint: const Text(
              "Select Room Size",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: createRoom,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 2.5, 50)),
            ),
            child: const Text(
              "Create",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
