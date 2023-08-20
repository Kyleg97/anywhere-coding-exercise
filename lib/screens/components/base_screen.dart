import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    this.title,
    required this.child,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: title != null
          ? AppBar(
              title: Text(title!),
              centerTitle: true,
              scrolledUnderElevation: 0.0,
            )
          : null,
      body: child,
    );
  }
}
