<img src="https://upload.wikimedia.org/wikipedia/commons/d/d9/Flag_of_Canada_%28Pantone%29.svg" alt="Flag of Canada" align="left" width="64">

# Meteorological Service Of Canada
![Swift 5.3](https://img.shields.io/badge/swift-5.3-orange)
![MIT License](https://img.shields.io/badge/license-MIT-lightgrey)

A Swift wrapper for Meteorological Service Of Canada Open Data.

## Platforms
| Platform | CI |
| :------- | :- |
| Apple    | [![Apple](https://github.com/WeatherProvider/MeteorologicalServiceOfCanada-Swift/workflows/Apple/badge.svg)](https://github.com/WeatherProvider/MeteorologicalServiceOfCanada-Swift/actions?query=workflow%3AApple) |
| Linux (Ubuntu & Amazon) | [![Linux](https://github.com/ualch9/MeteorologicalServiceOfCanada-Swift/workflows/Linux/badge.svg)](https://github.com/WeatherProvider/MeteorologicalServiceOfCanada-Swift/actions?query=workflow%3ALinux) |

## Installation
Swift Package Manager:
```
https://github.com/WeatherProvider/MeteorologicalServiceOfCanada-Swift.git
```

### Important
This library is still undergoing major changes. It is recommended you use exact version when installing to minimize future impacts.

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
