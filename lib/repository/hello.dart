import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tutorial/repository/data_service.dart';

part 'hello.g.dart'; // ファイル名と同じ名前にする

// メソッドの型を指定する
// 今回だと、クラスが型なので、DataServiceを指定する
// メソッドの引数の名前は、なんでもいいみたいです
@riverpod
DataService helloWorld(HelloWorldRef ref) {
  return DataService();
}
