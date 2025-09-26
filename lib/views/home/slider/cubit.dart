import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/home/slider/model.dart';
import 'package:thimar/views/home/slider/state.dart';

class Sliders extends Cubit<SliderState>{
  Sliders():super(SliderInitial());

  late List<SliderData> sliders;

  // get sliders data from api

  Future<void> getSliders() async {
    emit(SliderLoading());
    try {
      // get request
      var response = await Dio().get(
        'https://thimar.amr.aait-d.com/api/sliders',
      );
      // get response and pass it to the state
      sliders = (response.data['data'] as List)
          .map((e) => SliderData.fromJson(e))
          .toList();
      emit(SliderLoaded(sliders));
    } catch (e) {
      emit(SliderError(e.toString()));
    }
  }
}