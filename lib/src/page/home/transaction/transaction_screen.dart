part of 'transaction_page.dart';

///
/// @date: 2023/7/16 11:42
/// @author: Sensi
/// @remark:
///

class TransactionScreen extends StatefulWidget {
  final List<TransactionIconData> icons;

  const TransactionScreen({Key? key, required this.icons}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  late final KeyboardController _keyboardController = KeyboardController();
  late final ValueNotifier<int> _selectedController = ValueNotifier(-1);
  late final ValueNotifier<String> _firstOperationController = ValueNotifier('本人');
  late final ValueNotifier<String> _secondOperationController = ValueNotifier('微信');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _selectedController,
        builder: (context, value, child) {
          return GridViewCompat(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10.r,
            ),
            itemBuilder: (context, index) {
              return IconItem(
                iconData: widget.icons[index],
                onPressed: (id) {
                  _keyboardController.visible = true;
                  if (id == widget.icons[index].id) {
                    _selectedController.value = index;
                  }
                },
                selected: index == value,
              );
            },
            itemCount: widget.icons.length,
            keyboardController: _keyboardController,
            onFirst: () {},
            onSecond: () {},
            onChange: (value) {
              final transaction = Transaction(id: 0,
                  amount: value,
                  categoryId: 0,
                  date: DateHelper.getDate(),
                  createDate: DateHelper.getDateTime(),
                  memberId: 0,
                  transactionType: 0, userId: 0);

              TransactionMapper().saveOrUpdate(transaction);
            },
            firstOperationController: _firstOperationController,
            secondOperationController: _secondOperationController,
          );
        });
  }

  @override
  void dispose() {
    _keyboardController.dispose();
    _selectedController.dispose();
    super.dispose();
  }
}
