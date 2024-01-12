import 'app_text_style.dart';
import '../tag/text_tag.dart';

///
/// @date: 2022/12/9 17:47
/// @author: Sensi
/// @remark:
///

abstract class BaseStyle {
  final Map<TextTag, AppTextStyle> map = {};

  String fontFamily();

  AppTextStyle h0Emphasise();

  AppTextStyle h0Medium();

  AppTextStyle h1Emphasise();

  AppTextStyle h1Medium();

  AppTextStyle h2Emphasise();

  AppTextStyle h2Title();

  AppTextStyle h2Medium();

  AppTextStyle h2Regular();

  AppTextStyle h3Emphasise();

  AppTextStyle h3Medium();

  AppTextStyle h3Regular();

  AppTextStyle h4MediumBody();

  AppTextStyle h4Regular();

  AppTextStyle h5RegularRemarks();

  AppTextStyle defaultStyle();

  BaseStyle() {
    map[TextTag.h0Emphasise] = h0Emphasise();
    map[TextTag.h0Medium] = h0Medium();
    map[TextTag.h1Emphasise] = h1Emphasise();
    map[TextTag.h1Medium] = h1Medium();
    map[TextTag.h2Emphasise] = h2Emphasise();
    map[TextTag.h2Title] = h2Title();
    map[TextTag.h2Medium] = h2Medium();
    map[TextTag.h2Regular] = h2Regular();
    map[TextTag.h3Emphasise] = h3Emphasise();
    map[TextTag.h3Medium] = h3Medium();
    map[TextTag.h3Regular] = h3Regular();
    map[TextTag.h4MediumBody] = h4MediumBody();
    map[TextTag.h4Regular] = h4Regular();
    map[TextTag.h5RegularRemarks] = h5RegularRemarks();
  }
}
