import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  _dataSources();
  _repositories();
  _useCase();
  _blocs();
}

void _repositories() {}

void _dataSources() {}

void _useCase() {}

void _blocs() {}
