import 'package:get/get.dart';
import 'package:zigo/controllers/auth_controller.dart';



 // The Bindings with the dependencies are called even before the app boots up. Later we inject the bindings in the main()
 // Hence, we inject controllers inside the dependencies . . .
 // We inject with Get.put() command. Permanent ppty is set to make the controller to persist in the memory
class InitialBindings implements Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController(), permanent: true );
  }

}