///
/// @date: 2023/8/4 14:25
/// @author: Sensi
/// @remark:
///

abstract class InputState {}

///小数点已输入状态
class DecimalInputtedState extends InputState {}

///加号已输入状态
class PlusInputtedState extends InputState {}

///减号已输入状态
class MinusInputtedState extends InputState {}

List<InputState> inputStates = [];
