import 'package:flutter/material.dart';
import 'package:counter_app/services/supabase_service.dart';
import 'package:counter_app/pages/login_page.dart';
import 'package:counter_app/pages/chat_list_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SupabaseService _supabaseService = SupabaseService();

  @override
  void initState() {
    super.initState();
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    // ここでSupabaseのcurrentUserをチェック
    final user = _supabaseService.currentUser;

    // 少し待機(ローディング表示が見えるようにする場合)
    await Future.delayed(const Duration(seconds: 1));

    if (user != null) {
      // すでにログイン済み ⇒ チャット一覧へ
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ChatListPage()),
      );
    } else {
      // ログインしていない ⇒ ログイン画面へ
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // とりあえずローディング中の画面
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}