import 'package:connectivity/connectivity.dart';
import 'package:im_bored_app/core/network_checking/network_checker_contract.dart';

class NetworkCheckerImplementation extends NetworkCheckerContract {
  final Connectivity connectivity;

  NetworkCheckerImplementation({required this.connectivity});

  @override
  Future<bool> isConnected() async {
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
