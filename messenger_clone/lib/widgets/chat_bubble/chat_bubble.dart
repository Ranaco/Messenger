import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.msg, this.received = false})
      : super(key: key);
  final String msg;
  final bool received;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        !received ? 64.0 : 16.0,
        4,
        !received ? 16.0 : 154.0,
        4,
      ),
      child: Align(
        alignment: !received ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
              color: !received ? AppStyle.green : AppStyle.white,
              borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(10),
                  topLeft: const Radius.circular(10),
                  bottomLeft: Radius.circular(!received ? 10 : 0),
                  bottomRight: Radius.circular(!received ? 0 : 10))),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(msg),
          ),
        ),
      ),
    );
  }
}
