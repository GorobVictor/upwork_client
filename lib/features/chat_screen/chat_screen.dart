import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upwork_client/app/view/app.dart';
import 'package:upwork_client/constant.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/features/widgets/custom_text_widget.dart';
import 'package:upwork_client/utils/styles/colors/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<MessageDto> listMessages = [];
  final Future<List<MessageDto>?> func = MessageRepository().getMessages(0, 30);
  final ScrollController _scrollController = ScrollController();
  bool isEnabledButton = true;

  @override
  void initState() {
    super.initState();

    func.then((value) {
      try {
        setState(() {
          listMessages.addAll(value!);
        });
      } catch (e) {}
    }).catchError(print);
    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        await uploadMoreNotes();
      }
    });
  }

  Future<void> uploadMoreNotes() async {
    final result =
        await MessageRepository().getMessages(listMessages.length, 30);
    setState(() {
      listMessages.addAll(result!);
    });
  }

  Future<void> onDismissed(MessageDto message) async {
    try {
      final response = await MessageRepository().deleteMessage(message.id!);

      if (response) {
        listMessages.removeWhere((e) => e.id == message.id);
      }
    } catch (e) {
      Constant.showError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomMessageHistory(
          messages: listMessages,
          controller: _scrollController,
          onDismissed: onDismissed,
        ),
        CustomTextInput(
          isEnabled: isEnabledButton,
          onTap: (value) async {
            setState(() {
              isEnabledButton = false;
            });
            try {
              final response = await MessageRepository().sendMessage(value);
              if (response != null) {
                listMessages.insertAll(0, response.reversed);
              }
            } catch (e) {
              Constant.showError(e);
            }
            setState(() {
              isEnabledButton = true;
            });
          },
        ),
      ],
    );
  }
}

class CustomMessageHistory extends StatelessWidget {
  CustomMessageHistory({
    required this.messages,
    required this.controller,
    required this.onDismissed,
    super.key,
  });

  List<MessageDto> messages;
  ScrollController controller;
  Function(MessageDto) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 65),
      child: ListView.builder(
        controller: controller,
        itemCount: messages.length,
        shrinkWrap: true,
        reverse: true,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (context, index) {
          final message = messages[index];
          final messageText = message.text ?? '';
          return Dismissible(
            key: Key(message.id.toString()),
            onDismissed: (direction) {
              onDismissed(message);
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                top: 10,
                bottom: 10,
              ),
              child: Align(
                alignment: message.isOwner ?? false
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: message.isOwner ?? false
                        ? Colors.white
                        : AppColors.greenD5,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onDoubleTap: () async {
                      await Clipboard.setData(
                        ClipboardData(text: messageText),
                      );
                    },
                    onLongPress: () async {
                      await Clipboard.setData(
                        ClipboardData(text: messageText),
                      );
                    },
                    child: Text(messageText),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
