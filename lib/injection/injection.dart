import 'package:get_it/get_it.dart';

import '../export.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<ApiClient>(ApiClient(), signalsReady: true);
}
