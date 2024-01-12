import 'package:flutter/material.dart';

///
/// @date: 2023/07/10 20:50
/// @author: LovelyCoder
/// @remark:
///

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Not Found Page'),
        ),
        body: const Center(
          child: Text('Page Missing 404', style: TextStyle(fontSize: 30)),
        ));
  }
}
