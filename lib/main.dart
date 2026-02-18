import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

import 'package:reelhub/app.dart';
import 'package:reelhub/config/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initDI();
  final directory = await getApplicationDocumentsDirectory();
  Bloc.observer = TalkerBlocObserver(
    settings: const TalkerBlocLoggerSettings(enabled: kDebugMode),
  );
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(directory.path),
  );
  runApp(const ReelHub());
}
