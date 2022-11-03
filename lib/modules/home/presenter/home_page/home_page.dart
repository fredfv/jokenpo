import 'package:flutter/material.dart';
import 'package:jokenpo/modules/home/presenter/home_page/home_controller.dart';

import '../../models/choises.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(controller.iconChosenAction ?? '', style: const TextStyle(fontSize: 50)),
                        Text('You chose: ${controller.chosenAction}'),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(controller.iconComputerAction ?? '', style: const TextStyle(fontSize: 50)),
                        Text('Computer chose: ${controller.computerAction}'),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        controller.iconResult ?? Container(),
                        Text('The result is: ${controller.result}'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomSheet: SizedBox(
          height: 100,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              childAspectRatio: 1,
            ),
            itemCount: Choises.values.length,
            itemBuilder: (context, index) {
              var choise = Choises.values[index];
              return GestureDetector(
                onTap: () => controller.chooseAction(choise),
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(Choises.values[index].name),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
