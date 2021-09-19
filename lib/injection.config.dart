// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/home_page_controller.dart' as _i6;
import 'application/auth/register_controller.dart' as _i5;
import 'domain/auth/i_auth_facade.dart' as _i3;
import 'infrastructure/auth/hive_auth_facade.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthFacade>(() => _i4.HiveAuthFacade());
  gh.factory<_i5.RegisterController>(
      () => _i5.RegisterController(get<_i3.IAuthFacade>()));
  gh.factory<_i6.HomePageController>(
      () => _i6.HomePageController(get<_i3.IAuthFacade>()));
  return get;
}
