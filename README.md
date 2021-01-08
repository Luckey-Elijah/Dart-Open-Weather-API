# Dart OpenWeather API

A Library for interacting with the [OpenWeather API](https://openweathermap.org/api).

Add your API Key to `secrets.yaml`.

## Usage

Run with Dart:

```shell
git clone https://github.com/Luckey-Elijah/weather.git
cd weather
pub get
dart run bin/main.dart
```

Build the binary:

```shell
dart2native bin/main.dart -o build/weather
./build/weather
```

Output:

```output
A command line interface for getting the weather.

Usage: weather <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  now   Get the current weather.

Run "weather help <command>" for more information about a command.
```

