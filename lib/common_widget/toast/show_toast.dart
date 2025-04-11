import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_repositories/config/util/color_style.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    //todo: 変更
    backgroundColor: ColorStyle.darkBlack,
    textColor: ColorStyle.white,
    fontSize: CustomFontSize.normal,
  );
}
