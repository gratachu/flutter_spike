import 'package:counter_app/pages/chat_list_page.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/services/supabase_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SupabaseService _supabaseService = SupabaseService();

  Future<void> _handleGoogleSignIn() async {
    try {
      await _supabaseService.signInWithGoogle();
      // 認証フロー完了時、アプリ内ブラウザまたはシステムブラウザで承認→戻ってくる

      // 成功または手動でキャンセルした場合も呼ばれるが、
      // 成功の場合は currentUser に情報が入るはず
      if (_supabaseService.currentUser != null) {
        // ログイン成功時にSnackBarを表示
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('正常にログインしました')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChatListPage()),
        );
      } else {
        // currentUser が nullの場合はユーザーがキャンセルした等
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ログインがキャンセルされました')),
        );
      }
    } catch (e) {
      debugPrint('Google SignIn Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ログインに失敗しました: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // ログイン中かどうかでUIを切り替える場合は、_supabaseService.currentUser を参照
    final user = _supabaseService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ログインページ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (user == null) ...[
              // ログインしていないときはボタン表示
              ElevatedButton(
                onPressed: _handleGoogleSignIn,
                child: const Text('Googleでログイン'),
              ),
            ] else ...[
              // ログイン済みの場合は任意のメッセージを表示 (オプション)
              const Text('現在ログイン中です'),
            ],
          ],
        ),
      ),
    );
  }
}
