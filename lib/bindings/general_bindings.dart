import 'package:get/get.dart';
import 'package:saraswati_application_project/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{
  
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}