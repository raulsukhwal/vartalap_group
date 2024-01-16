import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sentByMe;
  final int time;

  const MessageTile(
      {Key? key,
      required this.message,
      required this.sender,
      required this.sentByMe,required this.time})
      : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: widget.sentByMe ? 0 : 24,
          right: widget.sentByMe ? 24 : 0),
      alignment: widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: widget.sentByMe
                ? const EdgeInsets.only(left: 30)
                : const EdgeInsets.only(right: 30),
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration( gradient:  const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF9FA8DA),
                  Color(0xFF90CAF9)]),
                borderRadius: widget.sentByMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(50),

                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(50),
                      ),
                color: widget.sentByMe
                    ? Theme.of(context).primaryColor
                    : Colors.grey[900]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.sender.toUpperCase(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      letterSpacing: -0.1),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(widget.message,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text("${DateFormat("h:mm:a").format(DateTime.now())}",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Color(0xFF9FA8DA)),),
          )

        ],
      ),
    );
  }
}
