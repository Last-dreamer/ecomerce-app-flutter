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
        super(ProductLoading()){
    on<LoadProduct>(_LoadProduct);
    on<UpdateProduct>(_UpdateProduct);

  }


  _LoadProduct(event, Emitter<ProductsState> emit) {
  _categorySubscription?.cancel();
  _categorySubscription = _productRepository
      .getAllProduct()
      .listen((c) => add(UpdateProduct(c)));
  dev.log("state checking ${state.props.map((e) => e)}");
  }

  _UpdateProduct(event, Emitter<ProductsState> emit)
  {

    dev.log("state is is ${state.props}");
    emit(ProductLoaded(product: event.product));
  }

}
