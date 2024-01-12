import 'package:app_component/app_component.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///
/// @data: 2023/7/8 14:02
/// @author: Sensi
/// @remark:
///
class RichTextCompat extends StatefulWidget {
  final TextSpanCompat spanCompat;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const RichTextCompat({
    Key? key,
    required this.spanCompat,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  @override
  State<RichTextCompat> createState() => _RichTextCompatState();
}

class _RichTextCompatState extends State<RichTextCompat> {
  TapGestureRecognizer? _recognizer;
  final List<TapGestureRecognizer?> _recognizers = [];

  @override
  void initState() {
    if (widget.spanCompat.onPressed != null) {
      _recognizer = TapGestureRecognizer();
    }
    if (widget.spanCompat.children != null) {
      for (final span in widget.spanCompat.children!) {
        if(span is TextSpanCompat){
          TextSpanCompat s = span as TextSpanCompat;
          _recognizers.add(s.onPressed != null ? TapGestureRecognizer() : null);
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      _getTextSpan(),
      textAlign: widget.textAlign,
      overflow: widget.overflow,
      maxLines: widget.maxLines,
    );
  }

  TextSpan _getTextSpan() {
    final spans = widget.spanCompat.children ?? [];
    List<InlineSpan> children = [];
    for (int i = 0; i < spans.length; i++) {
      if (spans[i] is TextSpanCompat) {
        final spanCompat = spans[i] as TextSpanCompat;
        final recognizer = _recognizers.length > i ? _recognizers[i] : null;
        TextSpan textSpan = TextSpan(
          text: spanCompat.text,
          style: spanCompat.style,
          recognizer: recognizer
            ?..onTap = () {
              spanCompat.onPressed?.call();
            },
        );
        children.add(textSpan);
      } else {
        children.add(spans[i]);
      }
    }
    return TextSpan(
        text: widget.spanCompat.text,
        style: widget.spanCompat.style,
        children: children,
        recognizer: _recognizer
          ?..onTap = () {
            widget.spanCompat.onPressed?.call();
          });
  }

  @override
  void dispose() {
    _recognizer?.dispose();
    for (final recognizer in _recognizers) {
      recognizer?.dispose();
    }
    super.dispose();
  }
}

class TextSpanCompat extends TextSpan {
  final VoidCallback? onPressed;

  const TextSpanCompat({
    super.text,
    super.children,
    super.style,
    this.onPressed,
  });
}
