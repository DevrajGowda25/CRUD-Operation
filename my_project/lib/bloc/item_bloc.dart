import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/services/item_service.dart';
import 'item_event.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository repository;

  ItemBloc(this.repository) : super(ItemLoading()) {
    on<LoadItems>(_onLoadItems);
    on<AddItem>(_onAddItem);
    on<UpdateItem>(_onUpdateItem);
    on<DeleteItem>(_onDeleteItem);
  }

  void _onLoadItems(LoadItems event, Emitter<ItemState> emit) async {
    try {
      final items = await repository.fetchItems();
      emit(ItemLoaded(items));
    } catch (e) {
      emit(ItemError(e.toString()));
    }
  }

  void _onAddItem(AddItem event, Emitter<ItemState> emit) async {
    try {
      await repository.addItem(event.item);
      add(LoadItems());
    } catch (e) {
      emit(ItemError(e.toString()));
    }
  }

  void _onUpdateItem(UpdateItem event, Emitter<ItemState> emit) async {
    try {
      await repository.updateItem(event.id, event.updatedItem);
      add(LoadItems());
    } catch (e) {
      emit(ItemError(e.toString()));
    }
  }

  void _onDeleteItem(DeleteItem event, Emitter<ItemState> emit) async {
    try {
      await repository.deleteItem(event.id);
      add(LoadItems());
    } catch (e) {
      emit(ItemError(e.toString()));
    }
  }
}
