import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_swap_bd/core/di/injection.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() => sl.init();
