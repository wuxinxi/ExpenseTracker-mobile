part of '../detail_page.dart';

///
/// @date: 2023/07/14 19:32
/// @author: LovelyCoder
/// @remark:
///

class DetailHeader extends StatelessWidget {
  const DetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [
      _DetailHeaderBackground(),
      _DetailHeaderForeground(),
    ]);
  }
}

class _DetailHeaderForeground extends StatelessWidget {
  const _DetailHeaderForeground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        20.h.spaceV(),
        '记YI笔'.text(tag: TextTag.h1Medium, fontColor: context.themeColor.whiteColor),
        20.h.spaceV(),
        const _DetailHeaderContent(),
        const _DetailHeaderList(),
      ]),
    );
  }
}

class _DetailHeaderBackground extends StatelessWidget {
  const _DetailHeaderBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.center, end: Alignment.bottomCenter, colors: [
        context.themeColor.primaryColor,
        context.themeColor.primaryColor,
        context.themeColor.whiteColor,
      ])),
    );
  }
}

class _DetailHeaderContent extends StatelessWidget {
  const _DetailHeaderContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      ///date
      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
        '2023年'.text(tag: TextTag.h4Regular),
        SizedBox(height: 5.h),
        RichTextCompat(
            spanCompat: '07'.textSpanCompat(tag: TextTag.h1Medium, children: [
          '月'.textSpanCompat(tag: TextTag.h3Medium),
          const WidgetSpan(child: Icon(Icons.arrow_drop_down_sharp)),
        ]))
      ]),

      ///收入
      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
        '收入'.text(tag: TextTag.h5RegularRemarks),
        SizedBox(height: 15.h),
        '3502.0'.text(tag: TextTag.h3Medium)
      ]),

      ///支出
      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
        '支出'.text(tag: TextTag.h5RegularRemarks),
        SizedBox(height: 15.h),
        '3502.0'.text(tag: TextTag.h3Medium)
      ])
    ]);
  }
}

class _DetailHeaderList extends StatelessWidget {
  const _DetailHeaderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      child: Card(
        color: context.themeColor.whiteColor,
        elevation: 0.3,
        child: Container(
          padding: EdgeInsets.all(15.r),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _iconLabel(context, label: S.current.order, iconData: Symbols.order_approve),
            _iconLabel(context, label: S.current.budget, iconData: Symbols.credit_score),
            _iconLabel(context, label: S.current.category, iconData: Icons.category_outlined),
            _iconLabel(context, label: S.current.member, iconData: Symbols.diversity_1),
          ]),
        ),
      ),
    );
  }

  IconLabel _iconLabel(
    BuildContext context, {
    required String label,
    required IconData iconData,
  }) {
    return IconLabel(
        icon: Icon(iconData, color: context.themeColor.primaryColor),
        label: label,
        textStyle: TextTag.h4Regular.toAppTextStyle().copyWith(fontColor: context.themeColor.secondGreyColor));
  }
}
