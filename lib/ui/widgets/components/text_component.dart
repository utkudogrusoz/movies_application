import 'package:flutter/material.dart';
import 'package:movies_application/core/constants/ui/padding_constants.dart';

class PaddingText extends StatelessWidget {
  final Color color;
  final String text;

  const PaddingText({Key key,@required this.color, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.instance.padding8,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline4.copyWith(color: color),
      ),
    );
  }
}

