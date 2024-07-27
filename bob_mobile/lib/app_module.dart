import 'package:bob_mobile/home/home_page.dart';
import 'package:bob_mobile/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage());
    r.child('/home', child: (context) => const HomePage());
  }
}
