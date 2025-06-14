import 'package:flutter/material.dart';
import 'package:cerboscan/core/utiles/const.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String name;
  final String image;
  final List<Msg> messages;

  const ChatDetailsScreen({
    super.key,
    required this.name,
    required this.image,
    required this.messages,
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  late List<Msg> _messages;
  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _messages = List.from(widget.messages);
  }

  void _sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        Msg(text: text, msgFrom: MessageFrom.fromSender),
      );
    });

    messageController.clear();

    // Scroll to bottom after slight delay
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage(widget.image),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Text(
                widget.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  return buildMessage(
                    text: msg.text,
                    messageFrom: msg.msgFrom,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 15.0),
                itemCount: _messages.length,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'type your message here ...',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    color: primaryColor,
                    child: MaterialButton(
                      onPressed: _sendMessage,
                      minWidth: 1.0,
                      child: const Icon(
                        Icons.send,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessage({
    required MessageFrom messageFrom,
    required String text,
  }) {
    return Align(
      alignment: messageFrom == MessageFrom.fromSender
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: messageFrom == MessageFrom.fromSender
              ? primaryColor.withOpacity(0.5)
              : Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10.0),
            topStart: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
            bottomEnd: messageFrom == MessageFrom.fromSender
                ? Radius.zero
                : Radius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

enum MessageFrom { fromSender, toReceiver }

class Msg {
  final String text;
  final MessageFrom msgFrom;

  Msg({required this.text, required this.msgFrom});
}

