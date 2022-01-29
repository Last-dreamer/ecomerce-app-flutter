import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom/models/product_model.dart';
import 'package:ecom/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as dev;
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  StreamSubscription? _categorySubscription;
  final ProductRepository _productRepository;


  ProductsBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading());

  @override
  Stream<ProductsState> mapEventToState(
      ProductsEvent event,
      ) async* {
    if (event is LoadProduct) {
      yield* _mapLoadCategoriesToState();
    }
    if (event is UpdateProduct) {
      yield* _mapUpdateCategoriesToState(event);
    }
  }

  Stream<ProductsState> _mapLoadCategoriesToState() async* {
    _categorySubscription?.cancel();
    _categorySubscription = _productRepository
        .getAllProduct()
        .listen((c) => add(UpdateProduct(c)));
    dev.log("state checking ${state.props.map((e) => e)}");
  }

  Stream<ProductsState> _mapUpdateCategoriesToState(UpdateProduct event) async* {
    dev.log("state is is ${state.props}");
    yield ProductLoaded(product: event.product);
  }
}
