

class Category {
  String id;
  String categoryName;

  Category({this.id, this.categoryName});

  Category.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        categoryName = json['name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.categoryName;

    return data;
  }

}
