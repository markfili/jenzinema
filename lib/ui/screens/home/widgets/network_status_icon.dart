import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/helpers/insets.dart';
import '../../../common/helpers/j_colors.dart';
import '../../../common/helpers/text_styles.dart';
import '../presenters/connectivity_presenter.dart';

class NetworkStatusIcon extends ConsumerWidget {
  const NetworkStatusIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var status = ref.watch(connectivityPresenter);
    var iconData = _NetworkStatusIconData.fromStatus(status);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: JColors.accent),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.medium),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  iconData.icon,
                  size: 15,
                  color: JColors.accent,
                ),
                const SizedBox(width: Insets.medium),
                CustomPaint(
                  size: const Size(16, 16),
                  painter: _NetworkStatusPainter(iconData.color),
                ),
              ],
            ),
            const SizedBox(
              height: Insets.small,
            ),
            Text(
              "Movies are ${iconData.text}",
              style: TextStyles.networkStatus,
            ),
          ],
        ),
      ),
    );
  }
}

class _NetworkStatusIconData {
  final String text;
  final Color color;
  final IconData icon;

  _NetworkStatusIconData(this.text, this.color, this.icon);

  factory _NetworkStatusIconData.fromStatus(ConnectivityStatus status) {
    var text = _matchStatusToText(status);
    var color = _matchStatusToColor(status);
    var iconData = _matchStatusToIcon(status);
    return _NetworkStatusIconData(text, color, iconData);
  }

  static String _matchStatusToText(ConnectivityStatus status) {
    if (status == ConnectivityStatus.connected) {
      return "fresh";
    }
    return "probably stale";
  }

  static Color _matchStatusToColor(ConnectivityStatus status) {
    if (status == ConnectivityStatus.connected) {
      return Colors.green;
    } else if (status == ConnectivityStatus.disconnected) {
      return Colors.red;
    }
    return Colors.yellow;
  }

  static IconData _matchStatusToIcon(ConnectivityStatus status) {
    if (status == ConnectivityStatus.connected) {
      return Icons.signal_cellular_4_bar_outlined;
    }
    return Icons.signal_cellular_connected_no_internet_0_bar_outlined;
  }
}

class _NetworkStatusPainter extends CustomPainter {
  final Paint fillPaint;

  _NetworkStatusPainter(Color color) : fillPaint = Paint()..color = color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 8, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
