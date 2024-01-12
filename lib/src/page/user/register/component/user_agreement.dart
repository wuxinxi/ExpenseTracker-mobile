part of '../register_page.dart';

///
/// @data: 2023/7/8 13:34
/// @author: Sensi
/// @remark:
///
class UserAgreement extends StatefulWidget {
  final UserAgreementController controller;
  final GestureTapCallback? onPressed;

  const UserAgreement({Key? key, required this.controller, this.onPressed}) : super(key: key);

  @override
  State<UserAgreement> createState() => _UserAgreementState();
}

class _UserAgreementState extends LifecycleState<UserAgreement> {
  late final TapGestureRecognizer _recognizer = TapGestureRecognizer();

  @override
  Listenable get listenable => widget.controller;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Checkbox(value: widget.controller.agree, onChanged: (value) => widget.controller.agree = value!),
      Text.rich("${S.current.agree}《".textSpan(children: [
        S.current.user_agreement.textSpan(
          fontColor: Theme.of(context).primaryColor,
          recognizer: _recognizer..onTap = widget.onPressed,
        ),
        "》".textSpan(),
      ]))
    ]);
  }

  @override
  dispose() {
    _recognizer.dispose();
    super.dispose();
  }
}

class UserAgreementController extends LifecycleChangeNotifier {
  late bool _agree;

  bool get agree => _agree;

  set agree(bool value) {
    _agree = value;
    notifyListeners();
  }

  UserAgreementController({bool agree = false}) : _agree = agree;
}
