import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/home/products/model.dart';
import 'package:thimar/views/home/products/state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsState());

  late List<ProductData> _products;

  // get products from api

  Future<void> fetchProducts() async {
    emit(ProductsLoadingState());
    try {
      // Simulate network delay
      var response = await Dio().get(
        'https://thimar.amr.aait-d.com/api/products',
      );

      _products = (response.data['data'] as List)
          .map((item) => ProductData.fromJson(item))
          .toList();
      emit(ProductsLoadedState(products: _products));
    } catch (e) {
      emit(ProductsErrorState(errorMessage: e.toString()));
    }
  }
}
