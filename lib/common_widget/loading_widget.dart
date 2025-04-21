import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repositories/config/util/color_style.dart';

class LoadingWidget extends ConsumerWidget {
  const LoadingWidget({super.key, this.color = ColorStyle.darkGrey});
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Transform.scale(
        scale: 1.2,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          child: const CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
