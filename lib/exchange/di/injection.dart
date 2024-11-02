import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:misty_test_task/exchange/di/injection.config.dart';

final getIt = GetIt.instance;
@injectableInit
Future<void> configureDependencies() async => await getIt.init();