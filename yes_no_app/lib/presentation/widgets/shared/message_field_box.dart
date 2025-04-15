import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    final inputDecoration = InputDecoration(
      filled: true,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      suffixIcon: IconButton(onPressed: () {
        // Handle the send button press here
        print('Send button pressed');
      }, icon: Icon(Icons.send_outlined)),
    );

    return TextFormField(
      decoration: inputDecoration,
      onFieldSubmitted: (text) {
        // Handle the message sending logic here
        print('Message sent: $text');
      },
      onChanged: (text) {
        // Handle the message input change logic here
        print('Message input changed: $text');
      },
    );
  }
}
