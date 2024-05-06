import 'package:flutter/material.dart';

class ResponsiveWeb extends StatelessWidget {
  final Widget child;
  const ResponsiveWeb({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 640) {
      return Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        constraints: const BoxConstraints(
          minWidth: 500, // Ajusta este valor según tus necesidades
        ),
        child: child,
      );
    }
    return child;
  }
}
