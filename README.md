# gecko_app

* A new Flutter project.

![flutter diagram](/assets/flutter.png)

## Getting Started

* open IOS simulator
`open -a Simulator`
* run 
run api server : move to project node-gecko-server
`npm run fake`
`flutter run` check below development phase
## how to add column
* add column to SqfliteHelper.dart
* update version number
* change gecko.dart model
* delete app from ios simulator 
* flutter run stop and restart

## ios device에 설치 

    project-folder/open ios/Runner.xcworkspace
    flutter run --release

## unit test

    flutter test test/tree_test.dart

## command history

    flutter create gecko_app
    cd gecko_app
    flutter run
    cd ..
    flutter pub add graphview
    flutter run
    exit
    cd ..
    flutter run
    flutter run --no-sound-null-safety

# development phase 

    flutter run --dart-define="TYPE=development"
    flutter run --dart-define="TYPE=test"
    flutter run  (production phase with no argument) 


     
