import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/screens/edit_screen.dart';
import 'package:my_project/services/item_service.dart';
import 'package:my_project/bloc/item_bloc.dart';
import 'package:my_project/bloc/item_event.dart';
import 'package:my_project/bloc/item_state.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final ItemRepository repository = ItemRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ItemBloc(repository)..add(LoadItems()),
        child: Scaffold(
            appBar: AppBar(title: const Text('Items')),
            body: BlocBuilder<ItemBloc, ItemState>(
              builder: (context, state) {
                if (state is ItemLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ItemLoaded) {
                  return ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return Card(
                        child: ListTile(
                          title: Text(item.username),
                          subtitle: Text(item
                              .description), // Assuming Item has a 'name' property
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                color: Colors.blue,
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditScreen(idValue: item.id)));
                                },
                              ),
                              IconButton(
                                color: Colors.red,
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  BlocProvider.of<ItemBloc>(context)
                                      .add(DeleteItem(item.id));
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is ItemError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return const Center(child: Text('Unknown state'));
              },
            )));
  }
}
