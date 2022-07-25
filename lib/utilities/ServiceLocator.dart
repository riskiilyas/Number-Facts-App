import 'package:number_facts/services/Networking.dart';

class ServiceLocator {
  static FactNetwork? _factNetwork;

  static FactNetwork getFactNetwork() {
    _factNetwork ??= FactNetwork();
    return _factNetwork!;
  }
}