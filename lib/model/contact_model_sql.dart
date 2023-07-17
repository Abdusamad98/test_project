
class ContactModelFields {
  static const String id = "_id";
  static const String name = "name";
  static const String phone = "phone";

  static const String contactsTable = "my_contacts";
}

class ContactModelSql {
  int? id;
  final String name;
  final String phone;

  ContactModelSql({
    this.id,
    required this.phone,
    required this.name,
  });

  ContactModelSql copyWith({
    String? name,
    String? phone,
    int? id,
  }) {
    return ContactModelSql(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      id: id ?? this.id,
    );
  }

  factory ContactModelSql.fromJson(Map<String, dynamic> json) {
    return ContactModelSql(
      name: json[ContactModelFields.name] ?? "",
      phone: json[ContactModelFields.phone] ?? "",
      id: json[ContactModelFields.id] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ContactModelFields.name: name,
      ContactModelFields.phone: phone,
    };
  }

  @override
  String toString() {
    return '''
      name: $name
      phone: $phone
      id: $id, 
    ''';
  }
}
