part of '../../repository_list_page.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({super.key, required this.repo});

  final ApiResponse repo;

  @override
  Widget build(BuildContext context) {
    /*
    多言語対応
    */
    final AppLocalizations? localizations = AppLocalizations.of(context);
    // AppLocalizations が取得できていない場合はローディングを表示
    if (localizations == null) {
      return const Scaffold(body: Center(child: LoadingWidget()));
    }

    // アイコンにも判定をつけるためにInwWellを使用
    return InkWell(
      onTap: () {
        // 詳細画面へ遷移
        context.pushNamed(AppRoute.repositoryDetail.name, extra: repo);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            // タイトル
            title: Text(
              repo.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: CustomFontSize.medium,
                fontWeight: FontWeight.bold,
              ),
            ),
            // 説明文
            subtitle: Text(
              repo.description ?? localizations.noDescription,
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
