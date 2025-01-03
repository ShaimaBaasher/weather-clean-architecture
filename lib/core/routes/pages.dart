import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_clean_arch/date_selection/cubit/date_selection_cubit.dart';
import 'package:weather_app_clean_arch/home/presentation/view/home.dart';

import '../../date_selection/date_selection.dart';
import '../../home/presentation/bloc/home_bloc.dart';
import '../service/injection_container.dart';
import 'app_routes.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObserver();

  static List<PageEntity> routes() {
    return [
      PageEntity(
        path: AppRoutes.INITIAL,
        page: const DateSelection(),
        bloc: BlocProvider(create: (_) => sl<DateCubit>()..fetchDates()),
      ),
      PageEntity(
        path: AppRoutes.HOME,
        page: Home(),
        bloc: BlocProvider(create: (_) => sl<HomeBloc>()),
      ),
    ];
  }

  static List<dynamic> provideBlocs(BuildContext context) {
    List<dynamic> blocList = <dynamic>[];
    for (var bloc in routes()) {
      blocList.add(bloc.bloc);
    }
    return blocList;
  }

  static MaterialPageRoute generateRouteSetting(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute<void>(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute<void>(builder: (_) => Home(), settings: settings);
  }
}

class PageEntity<T> {
  const PageEntity({
    required this.path,
    required this.page,
    required this.bloc,
  });

  final String path;
  final Widget page;
  final dynamic bloc;
}

Future<dynamic> pushRoute(
    {required BuildContext context,
    required Widget route,
    bool isFullScreen = false}) async {
  var response = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => route, fullscreenDialog: isFullScreen));
  return response;
}
