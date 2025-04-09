part of '../repository_list_page.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({super.key, required this.repo});

  final ApiResponse repo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        repo.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: ColorStyle.black,
          fontSize: CustomFontSize.medium,
        ),
      ),
      subtitle: Text(
        repo.description ?? '詳細がありません',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: ColorStyle.darkGrey,
          fontSize: CustomFontSize.small,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: ColorStyle.yellow),
          WidthMargin.mini,
          SizedBox(
            width: 40,
            child: Text(
              formatStars(repo.stars),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      onTap: () {
        context.pushNamed(AppRoute.repositoryDetail.name, extra: repo);
      },
    );
  }
}
