# todo_list

Todo list application. Uses Todo-backend API. To switch API implementation,
change baseUri in lib/data/repository/base_repository.dart

To run this project you should have installed Flutter SDK 3.10.0 or higher.
If you launch this project in the future and your Flutter SDK is not
compatible with this project you can run in your root flutter directory following commands:
1. git checkout 84a1e90
2. flutter

After flutter installation you need to run following commands:
1. flutter clean
2. flutter pub get
3. dart run build_runner build --delete-conflicting-outputs

Then connect device or emulator to your IDE and execute following commands:
1. flutter run

