# Share Location
Using this project,current location can be shared with other people.


## Getting Started

In this project google map was used on based.

![Splash screen](https://user-images.githubusercontent.com/40337665/71526237-f8cd1380-28e6-11ea-94ad-9d18ff54eb60.png)
![home](https://user-images.githubusercontent.com/40337665/71526265-1ac69600-28e7-11ea-9c21-bb27aca52389.png)
![map](https://user-images.githubusercontent.com/40337665/71526299-43e72680-28e7-11ea-99cb-89d4b46c9bfb.png)




## Prerequisites
* flutter
* IDE or editor to run app
* emulator or mobile device to see how is app




## Installation
1. Clone the repo
```sh
git clone https://github.com/ogulcankarayel5/flutter-sharelocation.git
```
2. Go to the project folder
```sh
cd flutter-sharelocation
```
3. Get dependencies

4. Get an api key [https://cloud.google.com/maps-platform/](https://cloud.google.com/maps-platform/)

5. Go this location in project ``` android/app/src/main/AndroidManifest.xml```
``` 
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```

4. Run the project
```sh
flutter run
```


## License
This project is licensed under the MIT License 
