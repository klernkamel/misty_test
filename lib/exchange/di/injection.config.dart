// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i4;
import 'package:misty_test_task/exchange/di/setup.dart' as _i7;
import 'package:misty_test_task/exchange/services/currency_service.dart' as _i5;
import 'package:misty_test_task/exchange/view_model/currency_store.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dip);
    await gh.factoryAsync<_i4.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i5.CurrencyService>(() => _i5.CurrencyService(
          gh<_i3.Dio>(),
          gh<_i4.Isar>(),
        ));
    gh.lazySingleton<_i6.CurrencyStore>(
        () => _i6.CurrencyStore(gh<_i5.CurrencyService>()));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
