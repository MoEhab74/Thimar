import 'package:thimar/views/home/categories/cubit/model.dart';

class CategoriesState {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
}

class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> list;  // Just a list of categories that i interested in building the ui by it

  const CategoriesLoaded(this.list);
}

class CategoriesError extends CategoriesState {
  final String message;

  const CategoriesError(this.message);
}