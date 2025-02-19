import 'package:dio/dio.dart';
import 'package:my_project/models/item.dart';

class ItemRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));

  Future<Item> addItem(Item item) async {
    final response = await _dio.post('/post-api', data: item.toJson());
    return Item.fromJson(response.data);
  }

  Future<List<Item>> fetchItems() async {
    try {
      final response = await _dio.get('/get-api');
      // Extract the list from the 'data' field
      final responseData = response.data;
      if (responseData is Map<String, dynamic> &&
          responseData.containsKey('data')) {
        final List<dynamic> itemsList = responseData['data'];
        return itemsList.map((json) => Item.fromJson(json)).toList();
      } else {
        throw Exception("Unexpected API response format: $responseData");
      }
    } catch (e) {
      if (e is DioException) {
        throw Exception(
            "Dio Error: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        Exception("Unexpected Error: $e");
      }
      return [];
    }
  }

  Future<Item> updateItem(String id, Item item) async {
    final response = await _dio.put('/update-api/$id', data: item.toJson());
    return Item.fromJson(response.data);
  }

  Future<void> deleteItem(String id) async {
    await _dio.delete('/delete-api/$id');
  }
}
