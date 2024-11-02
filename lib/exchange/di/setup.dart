import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:misty_test_task/exchange/di/setup.config.dart';
import 'package:misty_test_task/exchange/models/exchange_rate.dart';
import 'package:path_provider/path_provider.dart';


final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dip => Dio();

  @preResolve
  Future<Isar> get isar async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open([ExchangeRateSchema], directory: dir.path);
  }
}