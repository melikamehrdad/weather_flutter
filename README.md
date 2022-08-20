
# Flutter Weather App Example For dear Cloudwalk company

An example Flutter weather app using the [OpenWeatherMap API](https://openweathermap.org/api).

## Supported Features

- [x] Current weather (condition and temperature)
- [x] 5-day weather forecast
- [x] Search by city

## App Architecture

The app is composed by two main layers.

### Data Layer

The data layer contains a single weather repository that is used to fetch weather data from the [OpenWeatherMap API](https://openweathermap.org/api).

The data is then parsed (using Freezed) and returned using **type-safe** entity classes (`Weather` and `Forecast`).

### Presentation Layer

This layer holds all the widgets, along with their controllers.

Widgets do not communicate directly with the repository.

Instead, they watch some controllers that extend the `StateNotifier` class (using Riverpod).

This allows to map the data from the layer above to `AsyncValue` objects that can be mapped to the appropriate UI states (data, loading, error).

## Packages in use

- [riverpod](https://pub.dev/packages/riverpod) for state management
- [freezed](https://pub.dev/packages/freezed) for code generation
- [http](https://pub.dev/packages/http) for talking to the REST API
- [cached_network_image](https://pub.dev/packages/cached_network_image) for caching images
- [mocktail](https://pub.dev/packages/mocktail) for testing


## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/melikamehrdad/weather_flutter.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

Run the project:

```
flutter run 
```
