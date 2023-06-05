import 'package:flutter/material.dart';

class ItemBullet extends StatelessWidget {
  const ItemBullet({
    super.key,
    required this.color,
    this.shape = BoxShape.rectangle,
  });

  final Color color;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
      ),
    );
  }
}
