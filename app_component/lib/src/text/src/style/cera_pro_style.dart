import 'app_font_weight.dart';
import 'base_style.dart';
import 'app_text_style.dart';

///
/// @date: 2022/12/9 17:11
/// @author: Sensi
/// @remark:
///

class CeraProStyle extends BaseStyle {
  @override
  String fontFamily() => 'cera';

  @override
  AppTextStyle defaultStyle() => h4MediumBody();

  @override
  AppTextStyle h0Emphasise() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.black, fontSize: 32);

  @override
  AppTextStyle h0Medium() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.medium, fontSize: 32);

  @override
  AppTextStyle h1Emphasise() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.black, fontSize: 24);

  @override
  AppTextStyle h1Medium() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.medium, fontSize: 24);

  @override
  AppTextStyle h2Emphasise() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.black, fontSize: 20);

  @override
  AppTextStyle h2Title() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.bold, fontSize: 20);

  @override
  AppTextStyle h2Medium() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.medium, fontSize: 20);

  @override
  AppTextStyle h2Regular() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.light, fontSize: 20);

  @override
  AppTextStyle h3Emphasise() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.bold, fontSize: 18);

  @override
  AppTextStyle h3Medium() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.medium, fontSize: 18);

  @override
  AppTextStyle h3Regular() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.light, fontSize: 18);

  @override
  AppTextStyle h4MediumBody() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.medium, fontSize: 16);

  @override
  AppTextStyle h4Regular() => AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.light, fontSize: 16);

  @override
  AppTextStyle h5RegularRemarks() =>
      AppTextStyle(fontFamily: fontFamily(), fontWeight: AppFontWeight.medium, fontSize: 12);
}
