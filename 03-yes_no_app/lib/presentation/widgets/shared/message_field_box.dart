import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      filled: true,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      suffixIcon: IconButton(
        icon: Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          if (textValue.isEmpty) return;

          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (_) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (text) {
        // Handle the message sending logic here
        textController.clear();
        focusNode.requestFocus();
        onValue(text);
      },
    );
  }
}
