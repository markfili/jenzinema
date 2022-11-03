import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../app/config.dart';

var connectivityPresenter = StateNotifierProvider<ConnectivityPresenter, ConnectivityStatus>(
  (ref) => ConnectivityPresenter(),
);

enum ConnectivityStatus { connected, disconnected, unknown }

class ConnectivityPresenter extends StateNotifier<ConnectivityStatus> {
  late StreamSubscription<ConnectivityResult> subscription;
  late Timer periodicCheck;

  ConnectivityPresenter() : super(ConnectivityStatus.unknown) {
    subscription = Connectivity().onConnectivityChanged.listen(processConnectivityResult);
    periodicCheck = Timer.periodic(const Duration(seconds: 5), (_) => checkConnectivity());
    checkConnectivity();
  }

  void checkConnectivity() {
    Connectivity().checkConnectivity().then(processConnectivityResult);
  }

  void processConnectivityResult(ConnectivityResult result) async {
    ConnectivityStatus? status;
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        status = await testInternetConnection();
        break;
      case ConnectivityResult.none:
        status = ConnectivityStatus.disconnected;
        break;
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.vpn:
      default:
        break;
    }
    if (status != null && status != state) {
      state = status;
    }
  }

  Future<ConnectivityStatus?> testInternetConnection() async {
    var status = ConnectivityStatus.connected;
    try {
      var rawSocket = await RawSocket.connect(
        Config.imdbUrl,
        80,
        timeout: const Duration(seconds: 5),
      );
      await rawSocket.close();
    } on SocketException {
      status = ConnectivityStatus.disconnected;
    }
    return status;
  }

  @override
  void dispose() {
    if (mounted) {
      periodicCheck.cancel();
      subscription.cancel();
    }
    super.dispose();
  }
}
