import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Material(
          type: MaterialType.transparency,
          child: Center(
              child: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFFFCFCFC),
                boxShadow: [BoxShadow(color: Color(0x40000000), blurRadius: 10)]),
            child: const CircularProgressIndicator(),
          )),
        ));
  }
}
