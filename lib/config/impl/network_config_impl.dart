
import 'package:injectable/injectable.dart';
import 'package:random_dad_jokes/config/network_config.dart';
import 'package:random_dad_jokes/di/injection.dart';

@development
@Injectable(as: NetworkConfig)
class NetworkConfigDevelopmentImpl implements NetworkConfig {
  @override
  String get baseUrl => 'https://api.api-ninjas.com/v1/';

  @override
  Map<String, String> get headers => {
    'X-Api-Key': 'V/+n5GJRxSoM20K8NM3Dtg==RMn0x7hUCNYmyzWa'
  };
}

@staging
@Injectable(as: NetworkConfig)
class NetworkConfigStagingImpl implements NetworkConfig {
  @override
  String get baseUrl => 'https://api.api-ninjas.com/v1/';

  @override
  Map<String, String> get headers => {
    'X-Api-Key': 'V/+n5GJRxSoM20K8NM3Dtg==RMn0x7hUCNYmyzWa'
  };
}

@production
@Injectable(as: NetworkConfig)
class NetworkConfigProductionImpl implements NetworkConfig {
  @override
  String get baseUrl => 'https://api.api-ninjas.com/v1/';

  @override
  Map<String, String> get headers => {
    'X-Api-Key': 'V/+n5GJRxSoM20K8NM3Dtg==RMn0x7hUCNYmyzWa'
  };
}

