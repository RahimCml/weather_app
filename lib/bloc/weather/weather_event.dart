part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class WeatherFetchEvent extends WeatherEvent {

  final String cityName;

  WeatherFetchEvent({
    required this.cityName,
  });
  
}
