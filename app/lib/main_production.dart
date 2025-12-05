import 'package:rxce/app/app.dart';
import 'package:rxce/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
