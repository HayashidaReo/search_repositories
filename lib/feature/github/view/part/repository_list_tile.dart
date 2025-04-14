part of '../repository_list_page.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({super.key, required this.repo});

  final ApiResponse repo;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    // localizationsがnullの場合は代替テキストを使用
    final noDescriptionText = localizations?.noDescription ?? '詳細がありません';

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
              style: const TextStyle(
                fontSize: CustomFontSize.medium,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              repo.description ?? noDescriptionText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: CustomFontSize.small),
            ),
          ),

          HeightMargin.mini,
          // 情報アイコン
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconInfoWidget(icon: Icons.star, value: repo.stars),
              IconInfoWidget(icon: Icons.remove_red_eye, value: repo.watchers),
              IconInfoWidget(icon: Icons.call_split, value: repo.forks),
              IconInfoWidget(icon: Icons.bug_report, value: repo.issues),
            ],
          ),
        ],
      ),
    );
  }
}
