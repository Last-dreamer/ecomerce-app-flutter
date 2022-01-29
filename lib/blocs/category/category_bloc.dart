import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom/models/catergory_model.dart';
import 'package:ecom/repositories/category/category_repository.dart';

import 'package:equatable/equatable.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  StreamSubscription? _categorySubscription;
  final CategoryRepository _categoryRepository;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()){
    on<LoadCategories>(_LoadCategories);
    on<UpdateCategories>(_UpdateCategories);

  }

  _LoadCategories(event, Emitter<CategoryState> emit){
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository
        .getAllCategories()
        .listen((c) => add(UpdateCategories(c)));
  }
  _UpdateCategories(event, Emitter<CategoryState> emit){
     emit(CategoryLoaded(categoryModel: event.categoryModel));
  }

}
