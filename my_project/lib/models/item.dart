class Item {
  final String id;
  final String username;
  final String description;

  Item({required this.id, required this.username, required this.description});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id'],
      username: json['username'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'description': description,
    };
  }

  // Override toString() for better logging
  @override
  String toString() {
    return 'Item(id: $id, username: $username, description: $description)';
  }
}
