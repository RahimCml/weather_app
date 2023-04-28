import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/weather_fetch_model.dart';
import 'package:weather_app/data/service/weather_service.dart';
import 'package:weather_app/global/error/global_failure.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService _weatherService = WeatherService();
  final GlobalFailure _globalFailure = GlobalFailure();

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if(event is WeatherFetchEvent) {
        // emit(WeatherFetchLoading());
        final result = await _weatherService.fetchWeatherInfo(event.cityName);
        if(result is WeatherFetchModel) {
          emit(WeatherFetchSuccess(weatherInfo: result));
        } else {
          emit(WeatherFetchFailure(globalFailure: _globalFailure));
        }
      }
    });
  }
}
