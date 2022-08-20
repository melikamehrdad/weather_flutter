import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_flutter/src/entities/forecast/forecast_data.dart';
import 'package:weather_flutter/src/features/view/city_search_box.dart';
import 'package:weather_flutter/src/repositories/api_error.dart';
import 'package:weather_flutter/src/repositories/weather_repository.dart';

class DailyWeatherController extends StateNotifier<AsyncValue<ForecastData>> {
  DailyWeatherController(this._weatherRepository, {required String city})
      : super(const AsyncValue.loading()) {
    getWeather(city: city);
  }
  final HttpWeatherRepository _weatherRepository;

  Future<void> getWeather({required String city}) async {
    try {
      state = const AsyncValue.loading();
      final forecast = await _weatherRepository.getForecast(city: city);
      state = AsyncValue.data(ForecastData.from(forecast));
    } on APIError catch (e) {
      state = e.asAsyncValue();
    }
  }
}

final dailyWeatherControllerProvider = StateNotifierProvider.autoDispose<
    DailyWeatherController, AsyncValue<ForecastData>>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  final city = ref.watch(cityProvider);
  return DailyWeatherController(weatherRepository, city: city);
});
