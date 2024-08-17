import 'package:bob_mobile/login/login_page.dart';
import 'package:bob_mobile/login/login_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_app/home_app.dart';
import 'package:home_app/home_service.dart';
import 'package:shared_app/cache/user_cache.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add<Dio>(() => Dio(BaseOptions()));
    i.add<UserCache>(UserCache.new);
    i.add(UserService.new);
    i.add(HomeService.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage());
    r.child('/home', child: (context) => HomePage());
  }
}
