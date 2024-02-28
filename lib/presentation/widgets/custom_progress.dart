import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomProgressIndicator  extends StatelessWidget {
  double? loadingValue;
  CustomProgressIndicator({super.key, this.loadingValue});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: colorScheme.secondary,
        color: colorScheme.primary,
        value: loadingValue,
      ),
    );
  }
}