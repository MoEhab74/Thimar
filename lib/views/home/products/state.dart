import 'package:thimar/views/home/products/model.dart';

class ProductsState {
  final List<ProductData> products;
  ProductsState({this.products = const []});  // Act as the initial state
}

class ProductsLoadingState extends ProductsState {}

class ProductsErrorState extends ProductsState {
  final String errorMessage;

  ProductsErrorState({required this.errorMessage}); 
}

class ProductsLoadedState extends ProductsState {
  ProductsLoadedState({required super.products});
}