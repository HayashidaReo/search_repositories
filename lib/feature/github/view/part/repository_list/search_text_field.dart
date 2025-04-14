part of '../../repository_list_page.dart';

class SearchTextField extends HookWidget {
  final AppLocalizations localizations;
  final Function(String) onSearch;

  const SearchTextField({
    super.key,
    required this.localizations,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    // 検索テキスト
    final TextEditingController searchTextController =
        useTextEditingController();
    // 入力テキストの状態を管理（テキストフィールド内で完結させる）
    final ValueNotifier<String> inputText = useState<String>('');
    // 現在の検索キーワードを保持
    final ValueNotifier<String> currentKeyword = useState<String>('');

    // テキスト変更を監視
    useEffect(() {
      void listener() {
        inputText.value = searchTextController.text;
      }

      searchTextController.addListener(listener);
      return () {
        searchTextController.removeListener(listener);
      };
      // ignore: require_trailing_commas
    }, [searchTextController]);

    return TextField(
      controller: searchTextController,
      decoration: noneBorderTextFieldDecoration(
        label: localizations.searchTextFieldLabel,
        prefixIconOnPressed: null,
        prefixIcon: const SizedBox.shrink(),
        suffixIconOnPressed:
            (searchTextController.text.isNotEmpty)
                ? () {
                  if (searchTextController.text.trim() ==
                      currentKeyword.value) {
                    // 検索テキストをクリア
                    searchTextController.clear();
                    currentKeyword.value = '';
                    onSearch('');
                  } else {
                    // 検索実行
                    final keyword = searchTextController.text.trim();
                    currentKeyword.value = keyword;
                    onSearch(keyword);
                  }
                }
                : null,
        suffixIcon:
            searchTextController.text.isEmpty
                // 入力がない場合はアイコンを表示しない
                ? const SizedBox.shrink()
                : Icon(
                  (searchTextController.text.trim() == currentKeyword.value)
                      ? Icons.keyboard_backspace
                      : Icons.search,
                ),
        context: context,
      ),
      onSubmitted: (text) {
        // 検索実行
        final keyword = text.trim();
        currentKeyword.value = keyword;
        onSearch(keyword);
      },
    );
  }
}
