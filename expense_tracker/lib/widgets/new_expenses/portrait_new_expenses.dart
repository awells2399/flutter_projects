import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class PortraitNewExpense extends StatelessWidget {
  const PortraitNewExpense({
    super.key,
    required this.titleController,
    required this.amountController,
    required this.selectedDate,
    required this.selectedCategory,
    required this.presentDatePicker,
    required this.submitExpenseData,
    required this.setCategory,
  });

  final TextEditingController titleController;
  final TextEditingController amountController;
  final DateTime? selectedDate;
  final Category selectedCategory;
  final void Function() presentDatePicker;
  final void Function() submitExpenseData;
  final void Function(Category) setCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text('Title')),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: '\$',
                  label: Text('Amount'),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    selectedDate == null
                        ? 'No date selected'
                        : formatter.format(selectedDate!),
                  ),
                  IconButton(
                    onPressed: presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map(
                      (cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(cat.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setCategory(value);
                }),
            const Spacer(),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: submitExpenseData,
              child: const Text("Save Expense"),
            ),
          ],
        )
      ],
    );
  }
}
