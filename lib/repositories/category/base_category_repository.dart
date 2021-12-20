import 'package:ecom/models/catergory_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<CategoryModel>> getAllCategories();
}
