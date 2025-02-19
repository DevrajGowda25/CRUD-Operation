import 'package:my_project/models/item.dart';

abstract class ItemEvent {}

class LoadItems extends ItemEvent {}

class AddItem extends ItemEvent {
  final Item item;
  AddItem(this.item);
}

class UpdateItem extends ItemEvent {
  final String id;
  final Item updatedItem;
  UpdateItem(this.id, this.updatedItem);
}

class DeleteItem extends ItemEvent {
  final String id;
  DeleteItem(this.id);
}
