import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String name;
  final String imageUrl;

  const CategoryModel({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static List<CategoryModel> catergoryList = [
    const CategoryModel(
        name: 'pepsi', imageUrl: 'https://i.ibb.co/cvpntL1/coca-cola.png'),
    const CategoryModel(
        name: 'Condiments',
        imageUrl: 'https://i.ibb.co/px2tCc3/burger-king.png'),
    const CategoryModel(
        name: 'Confections',
        imageUrl: 'https://i.ibb.co/9fs7p0g/dairy-queen.png'),
    const CategoryModel(
        name: 'Dairy Products',
        imageUrl: 'https://i.ibb.co/GCCdy8t/green-peas.png'),
    const CategoryModel(
        name: 'Grains/Cereals', imageUrl: 'https://i.ibb.co/Yjr9XkV/heinz.png'),
    const CategoryModel(
        name: 'Meat/Poultry', imageUrl: 'https://i.ibb.co/rkNb7kP/kfc.png'),
    const CategoryModel(
        name: 'Produce', imageUrl: 'https://i.ibb.co/bLxVq2X/pizza-hut.png'),
    const CategoryModel(
        name: 'Seafood', imageUrl: 'https://i.ibb.co/XzcwL5s/starbucks.png'),
  ];
}
