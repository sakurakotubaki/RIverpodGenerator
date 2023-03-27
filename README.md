# riverpod_tutorial

サービスクラスを作成する
```dart
import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final db = FirebaseFirestore.instance;

  Future<void> createItem(String item) async {
    await db.collection('item').add({
      'item': item,
      'createdAt': Timestamp.fromDate(DateTime.now()),
    });
  }
}
```

ジェネレーターを生成する雛形を作成する。
```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tutorial/repository/data_service.dart';

part 'hello.g.dart';// ファイル名と同じ名前にする

// メソッドの型を指定する
// 今回だと、クラスが型なので、DataServiceを指定する
// メソッドの引数の名前は、なんでもいいみたいです
@riverpod
DataService helloWorld(HelloWorldRef ref) {
  return DataService();
}
```

ファイルを自動生成するコマンドを実行する
```
dart pub run build_runner watch
```

自動生成されたファイル
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hello.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$helloWorldHash() => r'985a81040f347641617543a0dab2be430c437e4c';

/// See also [helloWorld].
@ProviderFor(helloWorld)
final helloWorldProvider = AutoDisposeProvider<DataService>.internal(
  helloWorld,
  name: r'helloWorldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloWorldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HelloWorldRef = AutoDisposeProviderRef<DataService>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
```