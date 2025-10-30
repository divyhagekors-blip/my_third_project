import 'package:flutter_riverpod/legacy.dart';

final dataprovider = StateNotifierProvider<searchnotifier, AppState>((ref) {
  return searchnotifier();
});

class searchnotifier extends StateNotifier<AppState> {
  searchnotifier() : super(AppState(search: "",slider: 0.0, Switch: false, counter: 0));

  void textfield(String query) {
    state = state.copyWith(search: query);
  }
  void sliderdata(double value){
    state = state.copyWith(slider: value);
  }
  void switchprovider(bool value){
    state = state.copyWith(Switch: value);
  }
  void counterdata(int value){
    state = state.copyWith(counter: value);
  }
}

class AppState {
  final String search;
  final double slider;
  final bool Switch;
  final int counter;

  AppState({required this.search, required this.slider, required this.Switch, required this.counter});

  AppState copyWith({
    String? search,
    double? slider,
    bool? Switch,
    int? counter
  })
  {
    return AppState(
      search: search ?? this.search,
      slider: slider ?? this.slider,
      Switch: Switch ?? this.Switch,
      counter: counter ?? this.counter

    );
  }
}
