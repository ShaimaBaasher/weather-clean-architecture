import 'package:weather_app_clean_arch/home/domain/entities/hive_opened_status.dart';

import '../../../core/usecase/usecase.dart';
import '../../../core/utils/typedaf.dart';
import '../../data/models/hive_opened_status_model.dart';
import '../repositories/weather_repo.dart';

class StoreStatusData extends UseCaseWithParams<dynamic, List<HiveOpenedStatus>> {
  final WeatherRepo _repository;

  StoreStatusData(this._repository);

  @override
  ResultVoid call(List<HiveOpenedStatus> params) async => _repository.saveStatus(params);
}
