# Meteorological Service Of Canada
![Swift](https://github.com/WeatherProvider/MeteorologicalServiceOfCanada-Swift/workflows/Swift/badge.svg)

## Platforms
- Apple platforms
- Ubuntu

## Installation
Swift Package Manager:
```
https://github.com/WeatherProvider/MeteorologicalServiceOfCanada-Swift.git
```

### Important
This library is still undergoing major changes. It is recommended you use exact version when installing to minimize impacts.

## Usage
```swift
import MeteorologicalServiceOfCanada
let msc = MeteorologicalServiceOfCanada()
let stanleyPark = (latitude: 49.302877, longitude: -123.145848)

msc.getCurrentConditions(at: stanleyPark) { result in
    switch result {
    case .success(condition): print(conditions)
    case .failure(error):     print(error)
    }
}
```

This library currently only supports English.

## License
The weather data provided by this library is sourced from Environment and Climate Change Canada, which is a work of the Canadian government, subject to their [end-use license](https://eccc-msc.github.io/open-data/licence/readme_en/).

This Swift library is licensed under the MIT license.
