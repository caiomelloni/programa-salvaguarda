import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import '../util/custom_env.dart';

class CustomServer {
  Future<void> initialize(Handler handler) async {
    await shelf_io.serve(handler, CustomEnv.address, CustomEnv.port);
    print("server up and running at: http://${CustomEnv.address}:${CustomEnv.port}");
  }
}
