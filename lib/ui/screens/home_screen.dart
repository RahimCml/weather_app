import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textcontroller;

  void initState() {
    super.initState();
    _textcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if(state is WeatherFetchFailure) {
                  return const CircularProgressIndicator();
                } else if(state is WeatherFetchFailure) {
                  return Text(state.globalFailure.failureMessage);
                } else if(state is WeatherFetchSuccess) {
                  return Text(state.weatherInfo.main!.temp.toString(), style: const TextStyle(fontSize: 20),);
                }
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: _textcontroller,
              decoration: const InputDecoration(
                  hintText: 'select city..',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<WeatherBloc>()
                      .add(WeatherFetchEvent(cityName: _textcontroller.text));
                  _textcontroller.clear();
                },
                child: const Text('Button'))
          ],
        ),
      ),
    );
  }
}
