import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_bloc/widgets/widgets.dart';
import 'package:weather_bloc/repositories/repositories.dart';
import 'package:weather_bloc/blocs/blocs.dart';

class App extends StatefulWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  State<App> createState() => _AppState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather',
      home: Weather(
        weatherRepository: weatherRepository,
      ),
    );
  }
}

class _AppState extends State<App> {
  ThemeBloc _themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _themeBloc,
      child: BlocBuilder(
        bloc: _themeBloc,
        builder: (_, ThemeState themeState) {
          return MaterialApp(
            title: 'Flutter Weather',
            theme: themeState.theme,
            home: Weather(
              weatherRepository: widget.weatherRepository,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _themeBloc.dispose();
    super.dispose();
  }
}
