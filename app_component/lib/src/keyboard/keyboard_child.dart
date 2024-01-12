part of 'keyboard.dart';

///
/// @date: 2023/7/16 18:22
/// @author: Sensi
/// @remark:
///

enum KeyboardChildType {
  standard,
  today,
  otherDate,
  complete,
  delete,
}

class KeyboardChild extends StatelessWidget {
  final KeyboardChildType valueType;
  final String value;
  final VoidCallback? onPressed;

  const KeyboardChild({
    Key? key,
    required this.value,
    this.valueType = KeyboardChildType.standard,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = switch (valueType) {
      KeyboardChildType.today =>
        IconLabel(direction: Axis.horizontal, icon: const Icon(Icons.calendar_month), label: value, space: 3),
      KeyboardChildType.complete => Container(
          color: context.themeColor.primaryColor,
          alignment: Alignment.center,
          child: value.text(tag: TextTag.h3Medium, fontColor: context.themeColor.whiteColor)),
      KeyboardChildType.delete => const Icon(Icons.backspace_outlined),
      _ => value.text(tag: TextTag.h3Medium),
    };
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: kKeyboardValueHeight,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
