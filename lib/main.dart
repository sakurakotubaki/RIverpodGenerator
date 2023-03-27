import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/repository/hello.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleApp(),
    );
  }
}

// TextEditingControllerを使用するためのプロバイダー
final itemProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

class ExampleApp extends ConsumerWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ジェネレーターで生成されたプロバイダーを呼び出す
    final dataService = ref.watch(helloWorldProvider);

    /// TextEditingControllerを呼び出す
    final item = ref.watch(itemProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: item,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () async {
                  dataService.createItem(item.text);
                },
                child: const Text('Add')),
          ],
        ),
      ),
    );
  }
}
