import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gochat/chat/app.dart';
import 'package:gochat/screens/login_screen.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final client = StreamChatClient(streamKey);
  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: AppTheme.light(),
      // darkTheme: AppTheme.dark(),
      // themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'chatapp version end',
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          child: ChannelsBloc(
            child: UsersBloc(
              child: child!,
            ),
          ),
        );
      },
      home: LoginScreen(),
    );
  }
}

// import 'package:chatapp_v_end/app.dart';
// import 'package:chatapp_v_end/screens/screens.dart';
// import 'package:chatapp_v_end/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:chatapp_v_end/screens/select_user_screen.dart';
// import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
// void main() {
//   final client = StreamChatClient(streamKey);
//
//   runApp(
//     MyApp(
//       client: client,
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({
//     Key? key,
//     required this.client,
//   }) : super(key: key);
//
//   final StreamChatClient client;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: AppTheme.light(),
//       darkTheme: AppTheme.dark(),
//       themeMode: ThemeMode.dark,
//       title: 'chatapp version end',
//       builder: (context, child) {
//         return StreamChatCore(
//           client: client,
//           child: ChannelsBloc(
//             child: UsersBloc(
//               child: child!,
//             ),
//           ),
//         );
//       },
//       home: const SelectUserScreen(),
//     );
//   }
// }
