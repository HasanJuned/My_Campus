import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_campus/presentation/state_holders/auth_controller.dart';
import 'package:my_campus/presentation/state_holders/faculty_state_holders/group_chatting_controller.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';
import 'package:my_campus/presentation/ui/widgets/delete_card.dart';

class FacChatScreen extends StatefulWidget {
  FacChatScreen({
    super.key,
    required this.batch,
    required this.courseCode,
    required this.courseTitle,
    this.groupId,
  });

  final String batch, courseCode, courseTitle;
  dynamic groupId;

  @override
  State<FacChatScreen> createState() => _FacChatScreenState();
}

class _FacChatScreenState extends State<FacChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final GroupChattingController _chatController =
      Get.put(GroupChattingController());

  @override
  void initState() {
    super.initState();
    _chatController.getChat(widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: GetBuilder<GroupChattingController>(
          builder: (groupChattingController) {
        final chatData = _chatController.groupChatModel.data;
        final messages = <Message>[];

        if (chatData != null) {
          for (var data in chatData) {
            if (data.chat != null) {
              for (var chat in data.chat!) {
                messages.add(
                  Message(
                    text: chat.message ?? '',
                    isSentByMe: AuthController.fullName0 == chat.sender,
                    date: DateTime.parse(
                        chat.timestamp ?? DateTime.now().toIso8601String()),
                    time: chat.timestamp.toString(),
                    backendName: chat.sender.toString(),
                  ),
                );
              }
            }
          }
          messages.sort((a, b) => b.date.compareTo(a.date));
        }

        return Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = messages[index];

                  DateTime messageDate = DateTime(
                    message.date.year,
                    message.date.month,
                    message.date.day,
                  );
                  DateTime? previousMessageDate;
                  if (index < messages.length - 1) {
                    previousMessageDate = DateTime(
                      messages[index + 1].date.year,
                      messages[index + 1].date.month,
                      messages[index + 1].date.day,
                    );
                  }
                  bool showDateCard = index == messages.length - 1 ||
                      messageDate != previousMessageDate;

                  DateTime originalTime = DateTime.parse(message.time)
                      .add(const Duration(hours: 6));
                  String formattedTime =
                      DateFormat('hh:mm a').format(originalTime);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showDateCard)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DateCard(date: messageDate),
                          ),
                        ),
                      Align(
                        alignment:
                            AuthController.fullName0 == message.backendName
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: AuthController.fullName0 == message.backendName
                                ? Colors.blueAccent
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onLongPress: () {
                              if (message.isSentByMe) {}
                            },
                            child: Column(
                              crossAxisAlignment: AuthController.fullName0 == message.backendName
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message.text,
                                  style: TextStyle(
                                    color: AuthController.fullName0 == message.backendName
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  formattedTime,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AuthController.fullName0 == message.backendName
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _sendChat();
                      _chatController.getChat(widget.groupId);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  void _sendChat() {
    if (_controller.text.isNotEmpty) {
      for (int i = 0; i < _chatController.groupChatModel.data!.length; i++) {
        if (_chatController.groupChatModel.data?[i].name ==
            AuthController.fullName0) {
          _handleSubmitted(_controller.text,
              _chatController.groupChatModel.data![i].sId.toString());
          break;
        }
      }
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.courseCode,
            style: const TextStyle(
                fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          ),
          Text(
            widget.courseTitle,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.2),
          ),
        ],
      ),
      actions: [
        Text(
          '\nBatch: ${widget.batch}  ',
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        ),
      ],
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
      elevation: 0.5,
    );
  }

  void _handleSubmitted(String text, String senderId) {
    final date = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').format(DateTime.now());
    _chatController.groupChat(
      widget.groupId.toString(),
      senderId.toString(),
      text,
      AuthController.fullName0.toString(),
      date,
    );
    setState(() {});
    _controller.clear();
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  final String time;
  final String backendName;

  Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
    required this.time,
    required this.backendName,
  });
}
