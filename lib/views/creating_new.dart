import 'package:flutter/material.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'initial_form_async.dart';


class CreateNewObject extends StatefulWidget {
  const CreateNewObject({Key? key}) : super(key: key);

  @override
  State<CreateNewObject> createState() => _CreateNewObject();
}

class _CreateNewObject extends State<CreateNewObject> {
  String? initialDrop = Localozation.localization ? "AC asynchronous motor" : "Асинхронный двигатель";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          backgroundColor: const Color.fromARGB(255, 53, 0, 211),
          title: const Text('Edil-Oral.kz'),
        )),
        body: Center(
            child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(Localozation.localization ? "Select type of equipment" : "Выберите тип оборудования",
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              DDBCommon(
                initialDrop: initialDrop!,
                iterList: [
                  Localozation.localization ? "AC asynchronous motor" : "Асинхронный двигатель",
                  Localozation.localization ? "AC synchronous motor" : "Синхронный двигатель",
                  Localozation.localization ? "DC motor" : "Двигатель постоянного тока",
                  Localozation.localization ? "Generator" : "Генератор",
                  Localozation.localization ? "GATE" : "Шкаф",
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    initialDrop = newValue;
                  });
                },
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Center(
                  child: SizedBox(
                      child: ElevatedButton(
                        child: Text(Localozation.localization ? "Create new equpment" : "Создать новое оборудование"),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        onPressed: () {
                          if (initialDrop == "AC asynchronous motor" || initialDrop == "Асинхронный двигатель") {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InitialFormAsync(
                                      addSwitch: false,
                                      requestNumber: "N/A",
                                      serialNumber: "N/A")),
                            );
                          }
                        },
                      ))))
        ])));
  }
}
