import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:zelda_guide/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
