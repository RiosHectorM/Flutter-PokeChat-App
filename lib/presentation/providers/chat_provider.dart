import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_poke_info.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getPokeInfo = GetPokeInfo();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {

    if (text.isEmpty) return;

    final newMessage = Message(text: text.toUpperCase(), fromWho: FromWho.me);
    messageList.add(newMessage);

    if (newMessage.text.isNotEmpty) {
      await herReply(text);
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply(String pokemon) async {
    final herMessage = await getPokeInfo.getPoke(pokemon);
    messageList.add(herMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceOut,
    );
  }
}
