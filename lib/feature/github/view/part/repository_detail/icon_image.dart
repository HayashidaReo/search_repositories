part of '../../repository_detail_page.dart';

class IconImage extends StatelessWidget {
  const IconImage({super.key, required this.imageUrl, required this.iconSize});

  final String imageUrl;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder:
          (context, imageProvider) => ClipOval(
            child: Image(
              image: imageProvider,
              width: iconSize * 2,
              height: iconSize * 2,
              fit: BoxFit.cover,
            ),
          ),
      progressIndicatorBuilder:
          (context, url, downloadProgress) => SizedBox(
            width: iconSize * 2,
            height: iconSize * 2,
            child: const LoadingWidget(),
          ),
      errorWidget:
          (context, url, error) => SizedBox(
            width: iconSize * 2,
            height: iconSize * 2,
            child: const Icon(Icons.image_not_supported_rounded),
          ),
    );
  }
}
