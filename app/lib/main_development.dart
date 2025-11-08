import 'package:app/app/app.dart';
import 'package:app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
