# Weather APP
A Flutter app that shows how to uses MVVM and Clean Architecture Using Bloc and Cubit as the selected state managemnt approach .

## Implemented by Clean Architecture
The following project is structured with 3 layers:

- Presentation
- Domain
- Data

## Features
- UI calls method from Bloc.
- Bloc executes Use case
- Each Repository returns data from a Data Source (Cached or Remote) .
- HTTPS for networking .
- GetIT for Dependency injection .
- HIVE and SharedPrefs for local storage

## Scenario
Used http://api.openweathermap.org as a public api 

## At a glance

    user select a date then app gets a list of Weather from api .
    new page will be show weather details
    In the Item of each Weather, showed Weather name, temperature, humidity.
    And:
        Supported offline mode

