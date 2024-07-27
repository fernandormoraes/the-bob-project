import 'package:bob_mobile/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_app/home_app.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage());
    r.child('/home', child: (context) => const HomePage());
  }
}
