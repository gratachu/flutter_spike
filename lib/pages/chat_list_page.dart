import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  // ダミーのチャットデータ
  final List<String> dummyChats = [
    '友達Aとのチャット',
    '友達Bとのチャット',
    '友達Cとのチャット',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャット一覧'),
      ),
      body: ListView.builder(
        itemCount: dummyChats.length,
        itemBuilder: (context, index) {
          final chatTitle = dummyChats[index];
          return ListTile(
            title: Text(chatTitle),
            onTap: () {
              // ここで各チャット詳細ページへ遷移する処理などを行う
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ChatDetailPage(...)),
              // );
            },
          );
        },
      ),
    );
  }
}