import 'package:flutter/cupertino.dart';

class GradientColor extends StatelessWidget {
  const GradientColor({super.key, required this.gradient});
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
    );
  }
}
