import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/models/catergory_model.dart';
import 'package:ecom/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<CategoryModel>> getAllCategories() {
    return _firebaseFirestore.collection("categories").snapshots().map(
        (e) => e.docs.map((doc) => CategoryModel.fromFactory(doc)).toList());
  }
}
