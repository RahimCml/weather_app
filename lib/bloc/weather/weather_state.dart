part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherFetchLoading extends WeatherState {}

class WeatherFetchSuccess extends WeatherState {
  final WeatherFetchModel weatherInfo;
  WeatherFetchSuccess({
    required this.weatherInfo,
  });
}

class WeatherFetchFailure extends WeatherState {
  final GlobalFailure globalFailure;
  WeatherFetchFailure({
    required this.globalFailure,
  });
}

