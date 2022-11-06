import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/presenter/game_page/game_controller.dart';
import 'modules/home/presenter/game_page/game_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => GameController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => GamePage(
                  controller: Modular.get(),
                )),
      ];
}
