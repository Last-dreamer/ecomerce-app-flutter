
import 'package:ecom/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>>  getAllProduct();
}