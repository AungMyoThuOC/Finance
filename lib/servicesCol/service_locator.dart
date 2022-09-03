import 'package:finance/servicesCol/storage/hive_storage_service.dart';
import 'package:finance/servicesCol/storage/storage_service.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.I;

void setUpServiceLocator() {
  getIt.registerSingleton<StorageService>(HiveStorageService());
}
