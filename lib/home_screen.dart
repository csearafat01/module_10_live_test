import 'package:flutter/material.dart';

import 'item.dart';


class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ToDoPageView();
  }
}

class ToDoPageView extends State<ToDoPage> {


  List<Item> items = [
    Item(title: "Item 1"),
    Item(title: "Item 2"),
    Item(title: "Item 3"),
    Item(title: "Item 4"),
    Item(title: "Item 5"),
  ];
  Set<Item> selectedItems = <Item>{};

  void toggleItemSelection(Item item) {
    setState(() {
      item.isSelected = !item.isSelected;
      if (item.isSelected) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
  }

  void showSelectedItemsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Selected Items"),
          content: Text("Number of Selected items: ${selectedItems.length}"),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Screen'),
        elevation: 4,
      ),
      backgroundColor: Colors.grey.shade200,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.title),
            tileColor: item.isSelected ? Colors.blue : null,
            onTap: () {
              toggleItemSelection(item);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showSelectedItemsDialog,
        child: const Icon(Icons.check),
      ),
    );
  }
}
