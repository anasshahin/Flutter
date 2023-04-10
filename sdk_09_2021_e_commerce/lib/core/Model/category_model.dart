class CategoryModel {
  String? id;
  String? name;
  String? image;
  String? addingDate;

  CategoryModel.empty();

  CategoryModel({this.id, this.name, this.image, this.addingDate});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    addingDate = json['addingDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['addingDate'] = addingDate;
    return data;
  }
}

class CategoryList {
  List<CategoryModel> categories;

  CategoryList({required this.categories});

  factory CategoryList.fromJson(List<dynamic> data) {
    List<CategoryModel> categoryList = [];
    categoryList =
        data.map((element) {
          return CategoryModel.fromJson(Map<String,dynamic>.from(element));
        }).toList();
    return CategoryList(categories: categoryList);
  }
}

List<CategoryModel> data = [
  CategoryModel(
      id: 'e4432c9a-b234-4e47-887e-2bb5493d6608',
      image: 'assets/png_icons/Icon_Mens Shoe.png',
      name: 'Men',
      addingDate: DateTime.now().toString()),
  CategoryModel(
      id: '3a24d629-2d0d-4bfa-abbe-4fee61bbe6a6',
      image: 'assets/png_icons/Icon_Womens Shoe.png',
      name: 'Women',
      addingDate: DateTime.now().toString()),
  CategoryModel(
      id: '717f71f5-ad40-43fe-8a6a-dfefb85f6ab1',
      image: 'assets/png_icons/Icon_Devices.png',
      name: 'Devices',
      addingDate: DateTime.now().toString()),
  CategoryModel(
      id: '5f0f6b74-9a79-4fed-b165-54804c4a7fc9',
      image: 'assets/png_icons/Icon_Gadgets.png',
      name: 'Gadgets',
      addingDate: DateTime.now().toString()),
];
