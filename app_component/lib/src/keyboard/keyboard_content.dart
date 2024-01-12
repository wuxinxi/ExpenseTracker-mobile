part of 'keyboard.dart';

///
/// @date: 2023/07/16 18:27
/// @author: LovelyCoder
/// @remark:
///

class KeyboardContent extends StatelessWidget {
  final Function(int)? onNum;
  final VoidCallback? onDelete;
  final VoidCallback? onDot;
  final VoidCallback? onDay;
  final VoidCallback? onMinus;
  final VoidCallback? onPlus;
  final VoidCallback? onFirst;
  final VoidCallback? onSecond;
  final ValueNotifier<String> firstOperationController;
  final ValueNotifier<String> secondOperationController;
  final VoidCallback? onCompleted;
  final VoidCallback? onEqual;
  final KeyboardDateController keyboardDateController;
  final KeyboardCompleteController keyboardCompleteController;

  const KeyboardContent({
    Key? key,
    this.onNum,
    this.onDelete,
    this.onDot,
    this.onDay,
    this.onMinus,
    this.onPlus,
    this.onFirst,
    this.onSecond,
    this.onCompleted,
    this.onEqual,
    required this.keyboardDateController,
    required this.keyboardCompleteController,
    required this.firstOperationController,
    required this.secondOperationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: context.themeColor.secondGreyColor.withOpacity(0.3), width: .6),
      children: [
        TableRow(children: [
          KeyboardChild(
            value: '7',
            onPressed: () => onNum?.call(7),
          ),
          KeyboardChild(value: '8', onPressed: () => onNum?.call(8)),
          KeyboardChild(value: '9', onPressed: () => onNum?.call(9)),
          KeyboardDate(controller: keyboardDateController, onPressed: onDay),
        ]),
        TableRow(children: [
          KeyboardChild(value: '4', onPressed: () => onNum?.call(4)),
          KeyboardChild(value: '5', onPressed: () => onNum?.call(5)),
          KeyboardChild(value: '6', onPressed: () => onNum?.call(6)),
          KeyboardOperation(operationController: firstOperationController,onPressed: onFirst),
        ]),
        TableRow(children: [
          KeyboardChild(value: '1', onPressed: () => onNum?.call(1)),
          KeyboardChild(value: '2', onPressed: () => onNum?.call(2)),
          KeyboardChild(value: '3', onPressed: () => onNum?.call(3)),
          KeyboardOperation(operationController: secondOperationController,onPressed: onSecond),
        ]),
        TableRow(children: [
          KeyboardChild(value: '.', onPressed: onDot),
          KeyboardChild(value: '0', onPressed: () => onNum?.call(0)),
          KeyboardChild(value: '', valueType: KeyboardChildType.delete, onPressed: onDelete),
          KeyboardCompleted(
            keyboardCompleteController: keyboardCompleteController,
            onCompleted: onCompleted,
            onEqual: onEqual,
          ),
        ]),
      ],
    );
  }
}
