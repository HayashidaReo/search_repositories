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
                    _search(
                      searchTextController.text,
                      currentKeyword,
                      searchTextController,
                    );
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
        _search(text, currentKeyword, searchTextController);
      },
    );
  }

  void _search(
    String text,
    ValueNotifier<String> currentKeyword,
    TextEditingController searchTextController,
  ) {
    // 検索実行
    if (text.trim().length >= 236) {
      // 236文字以上は切り捨て
      currentKeyword.value = text.trim().substring(0, 236);
      searchTextController.text = text.trim().substring(0, 236);
      showToast('検索文字は236文字までです');
    } else {
      currentKeyword.value = text.trim();
    }
    // 検索実行
    onSearch(currentKeyword.value);
  }
}
