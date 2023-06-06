import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

import 'item_bullet.dart';

class DismissibleGroceryItem extends StatelessWidget {
  const DismissibleGroceryItem({
    super.key,
    required this.item,
    required this.removeItem,
  });

  final GroceryItem item;
  final Function(GroceryItem) removeItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      background: Container(color: item.category.color),
      child: ListTile(
        leading: ItemBullet(color: item.category.color),
        title: Text(item.name),
        trailing: Text(item.quantity.toString()),
      ),
      onDismissed: (direction) => removeItem(item),
    );
  }
}
