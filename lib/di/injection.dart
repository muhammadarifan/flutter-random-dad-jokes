import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:random_dad_jokes/di/injection.config.dart';

final getIt = GetIt.instance;

const Environment development = Environment('DEVELOPMENT');
const Environment staging = Environment('STAGING');
const Environment production = Environment('PRODUCTION');

const String apiKey = 'V/+n5GJRxSoM20K8NM3Dtg==RMn0x7hUCNYmyzWa';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureInjection(Environment environment) {
  $initGetIt(getIt, environment: environment.name);
}
