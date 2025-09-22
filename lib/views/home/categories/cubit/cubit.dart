import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'model.dart';
part 'state.dart';
class CategoriesCubit extends Cubit<CategoriesState>{
   CategoriesCubit() : super(const CategoriesInitial());

   // get categories data from api

   Future<void> getCategories() async {
     emit(const CategoriesLoading());
     try {
       // get request
       var response = await Dio().get('https://thimar.amr.aait-d.com/api/categories');
       // get response and pass it to the state

     } catch (e) {
       emit(CategoriesError(e.toString()));
     }
   }
}