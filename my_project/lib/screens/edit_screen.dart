import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc/item_bloc.dart';
import 'package:my_project/bloc/item_event.dart';
import 'package:my_project/models/item.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.idValue});
  final String idValue;
  @override
  State<EditScreen> createState() => _EditScreen();
}

class _EditScreen extends State<EditScreen> {
  List<Item> items = [];

  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Edit User",
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: "User Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: description,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.description),
                    hintText: "Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 400.0,
                height: 50.0,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    final newItem = Item(
                        id: widget.idValue,
                        username: name.text,
                        description: description.text);
                    BlocProvider.of<ItemBloc>(context)
                        .add(UpdateItem(widget.idValue, newItem));
                    Navigator.pop(context);
                  },
                  child: const Text("Update User",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
