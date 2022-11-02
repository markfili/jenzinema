import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var connectivityPresenter = StateNotifierProvider<ConnectivityPresenter, ConnectivityStatus>(
  (ref) => ConnectivityPresenter(),
);

enum ConnectivityStatus { connected, disconnected, unknown }

class ConnectivityPresenter extends StateNotifier<ConnectivityStatus> {
  ConnectivityPresenter() : super(ConnectivityStatus.unknown) {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        ConnectivityStatus? status;
        switch (result) {
          case ConnectivityResult.mobile:
          case ConnectivityResult.wifi:
            status = ConnectivityStatus.connected;
            break;
          case ConnectivityResult.none:
            status = ConnectivityStatus.disconnected;
            break;
          case ConnectivityResult.bluetooth:
          case ConnectivityResult.ethernet:
          case ConnectivityResult.vpn:
          default:
            // unhandled connectivity options
            break;
        }
        if (status != null && status != state) {
          state = status;
        }
      },
    );
  }
}
