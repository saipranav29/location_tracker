import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  final Color color;

  const LoadingComponent({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: color),
    );
  }
}
