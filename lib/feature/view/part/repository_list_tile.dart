part of '../repository_list_page.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({super.key, required this.repo});

  final ApiResponse repo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoute.repositoryDetail.name, extra: repo);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              repo.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorStyle.black,
                fontSize: CustomFontSize.medium,
                fontWeight: FontWeight.bold,
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
          ),

          HeightMargin.mini,
          // 情報アイコン
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _iconInfo(Icons.star, repo.stars),
              _iconInfo(Icons.remove_red_eye, repo.watchers),
              _iconInfo(Icons.call_split, repo.forks),
              _iconInfo(Icons.bug_report, repo.issues),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconInfo(IconData icon, int value) {
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
