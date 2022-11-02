import 'package:flutter_modular/flutter_modular.dart';
import 'package:jokenpo/modules/home/presenter/home_page/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
      ];
}