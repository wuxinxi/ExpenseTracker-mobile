part of '../main_page.dart';

///
/// @date: 2023/7/14 19:44
/// @author: Sensi
/// @remark:
///

class MainScreen extends StatefulWidget {
  final VoidCallback onCenterTap;

  const MainScreen({
    Key? key,
    required this.onCenterTap,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends LifecycleState<MainScreen> {
  late final PageChangeNotifier _changeNotifier = PageChangeNotifier();
  late final List<Widget> _items = const [
    KeepAliveWrapper(child: DetailPage(label: "明细")),
    KeepAliveWrapper(child: DetailPage(label: "分析")),
    KeepAliveWrapper(child: DetailPage(label: "发现")),
    KeepAliveWrapper(child: DetailPage(label: "我的")),
  ];
  final _centerIndex = 2;

  @override
  Listenable? get listenable => _changeNotifier;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        hideAppbar: true,
        floatingActionButton: FloatingActionButton(
          onPressed: widget.onCenterTap,
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: const CenterDockedFabLocationOffsetY(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _changeNotifier.index,
            onTap: (index) {
              if (index == _centerIndex) {
                widget.onCenterTap.call();
                return;
              }
              _changeNotifier.bottomBarIndex = index;
              _changeNotifier.bodyIndex(index <= 1 ? index : index - 1);
            },
            items: homeItems),
        body: PageView.builder(
            controller: _changeNotifier.pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              if (index <= 1) {
                _changeNotifier.bottomBarIndex = index;
                return;
              }
              if (index >= _centerIndex) {
                _changeNotifier.bottomBarIndex = index + 1;
              }
            },
            itemBuilder: (context, index) => _items[index]));
  }
}
