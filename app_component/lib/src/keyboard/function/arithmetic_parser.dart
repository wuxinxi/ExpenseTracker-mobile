///
/// @date: 2023/7/28 17:24
/// @author: Sensi
/// @remark:
///

class ArithmeticParser {
  late String _expression;
  late int _position;

  ArithmeticParser(String expression) {
    _expression = expression.replaceAll(' ', '');
    _position = 0;
  }

  double parse() {
    double operand1 = _parseOperand();
    String operator = _parseOperator();
    double operand2 = _parseOperand();

    if (operator == '+') {
      return operand1 + operand2;
    } else {
      return operand1 - operand2;
    }
  }

  double _parseOperand() {
    bool isNegative = false;
    if (_expression[_position] == '-') {
      isNegative = true;
      _position++;
    }

    int start = _position;
    while (_position < _expression.length &&
        (RegExp(r'^\d$').hasMatch(_expression[_position]) || _expression[_position] == '.')) {
      _position++;
    }

    double operand = double.tryParse(_expression.substring(start, _position)) ?? 0.0;
    return isNegative ? -operand : operand;
  }

  String _parseOperator() {
    String operator = _expression[_position];
    _position++;
    return operator;
  }
}
