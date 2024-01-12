part of '../detail_page.dart';

///
/// @date: 2023/08/06 11:53
/// @author: LovelyCoder
/// @remark:
///

class DetailList extends StatelessWidget {
  final List<Transaction> transactions;

  const DetailList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            shape: RoundedRectangleBorder(side: BorderSide(),
                borderRadius:BorderRadius.all(Radius.circular(5)) ),
            title: transactions[index].createDate.text(),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}
