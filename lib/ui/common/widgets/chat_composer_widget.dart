import 'package:flutter/material.dart';

class ChatComposerWidget extends StatelessWidget {
  const ChatComposerWidget({super.key, this.controller, this.send});

  final TextEditingController? controller;
  final void Function()? send;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.purple[50],
                filled: true,
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: send,
            icon: Icon(
              Icons.send,
              size: 25,
              color: Colors.purple[800],
            ),
          )
        ],
      ),
    );
  }
}
