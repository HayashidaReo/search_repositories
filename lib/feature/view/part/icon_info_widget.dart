part of '../repository_list_page.dart';

class IconInfoWidget extends StatelessWidget {
  const IconInfoWidget({super.key, required this.icon, required this.value});

  final IconData icon;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: ColorStyle.darkGrey),
        WidthMargin.mini,
        Text(
          formatStars(value),
          style: TextStyle(
            fontSize: CustomFontSize.small,
            color: ColorStyle.darkGrey,
          ),
        ),
      ],
    );
  }
}
