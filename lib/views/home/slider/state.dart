import 'package:thimar/views/home/slider/model.dart';

class SliderState{}

class SliderInitial extends SliderState{}

class SliderLoading extends SliderState{}

class SliderLoaded extends SliderState{
  final List<SliderData> list;

  SliderLoaded(this.list);
}

class SliderError extends SliderState{
  final String message;

  SliderError(this.message);
}
