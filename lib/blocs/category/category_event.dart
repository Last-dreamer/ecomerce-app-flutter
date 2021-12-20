part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategories  extends CategoryEvent {}

class UpdateCategories extends CategoryEvent {
  final List<CategoryModel> categoryModel;

  const UpdateCategories(this.categoryModel);

  @override
  List<Object?> get props => [categoryModel];
}

