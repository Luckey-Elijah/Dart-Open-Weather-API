# Weather CLI

A command-line application for fetching your local weather.

```shell
$ weather
> ⛈ 78°F at 33801
```
```shell
$ weather -z 10001
> 🌨 41°F at 10001
```

## Usage

1. Add an [Open Weather API](https://home.openweathermap.org/api_keys) key to the [`secrets.yaml`](./secrets.yaml) file.
2. Get dependencies: `dart pub get` in root directory.
3. Build app: `dart2native bin/weather.dart`.
4. Add to you path: `export PATH:$PATH bin/weather`
