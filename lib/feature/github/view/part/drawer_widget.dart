part of '../repository_list_page.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(
              'GitHubリポジトリ検索',
              style: TextStyle(
                fontSize: CustomFontSize.large,
                // color: ColorStyle.white,
              ),
            ),
          ),
          ListTile(
            title: const Text('ログアウト'),
            onTap: () async {
              _logout(context, ref);
            },
          ),
          ListTile(
            title: const Text('削除'),
            onTap: () async {
              _deleteAccount(context, ref);
            },
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context, WidgetRef ref) {
    return showConfirmDialog(
      context: context,
      text: 'ログアウトしますか？',
      onPressed: () async {
        context.pop();
        showLoadingDialog('ログアウト中...');
        await ref.read(authControllerProvider.notifier).signOut();
        hideLoadingDialog();
        showToast('ログアウトしました');
      },
    );
  }

  void _deleteAccount(BuildContext context, WidgetRef ref) {
    return showConfirmDialog(
      context: context,
      text: '本当にアカウントを削除しますか？',
      onPressed: () async {
        context.pop();
        showLoadingDialog('削除中...');
        await ref.read(authControllerProvider.notifier).delete();
        hideLoadingDialog();
        showToast('アカウントを削除しました');
      },
    );
  }
}
