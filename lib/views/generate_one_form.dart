import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:snack/snack.dart';
import 'package:work_shop_app/models/docx.dart';

class GeneratingOne extends StatefulWidget {
  const GeneratingOne({Key? key}) : super(key: key);
  @override
  State<GeneratingOne> createState() => _GeneratingOne();
}

class _GeneratingOne extends State<GeneratingOne> {
  final bar = SnackBar(
      content: Text(Localozation.localization
          ? "Generation is completed"
          : "Генерация завершилась успешно"));
  final barNotOk = SnackBar(
      content: Text(Localozation.localization
          ? "Something has gone wrong"
          : "Что-то пошло не так"));
  String? requestNumber;
  String? serialNumber;
  bool saveSwitch = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          backgroundColor: const Color.fromARGB(255, 53, 0, 211),
          title: const Text('Edil-Oral.kz'),
        )),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: Builder(
                builder: (context) =>
                    
                    Form(
                        key: _formKey,
                        child: ListView(cacheExtent: 20000000, children: [
                          CommonForm(
                            keyBoardType: TextInputType.number,
                            labelText: Localozation.localization
                                ? "Request number"
                                : "Номер заявки",
                            emptyValue: Localozation.localization
                                ? "Enter request number"
                                : "Введите номер заявки",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) =>
                                setState(() => requestNumber = value),
                          ),
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Serial number"
                                : "Серийный номер",
                            emptyValue: Localozation.localization
                                ? "Enter serial number"
                                : "Введите серийный номер",
                            textInputAction: TextInputAction.done,
                            onSaved: (value) =>
                                setState(() => serialNumber = value),
                          ),
                          
                          Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20.0,
                              ),
                              child: Center(
                                  child: SizedBox(
                                child: ElevatedButton(
                                  child: Text(Localozation.localization
                                      ? "Check"
                                      : "Проверить"),
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder()),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      setState(() {
                                        saveSwitch = true;
                                      });
                                    }
                                  },
                                ),
                              ))),
                          if (saveSwitch)
                            FutureBuilder<Document>(
                              future: Firestore.instance
                                  .collection('State')
                                  .document('R:$requestNumber;SN:$serialNumber')
                                  .get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<Document> document) {
                                if (document.hasError) {
                                  return Center(
                                      child: Text(
                                          Localozation.localization
                                              ? "Something went wrong"
                                              : "Что-то пошло не так",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)));
                                }
                                
                                if (document.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data =
                                      document.data!.map;
                                  List<String> stateListEntryCard = [
                                    "exDeMechanicalShaftFlame",
                                    "exDeMechanicalCLearance",
                                    "exDeMechanicalStatorEnd",
                                    "exDeTerminalBox",
                                    "visualInspectionElectrical",
                                    "deviationActionNote",
                                    "entryTable",
                                    "electricalMeasurement",
                                    "visualInspectionMechanicalAndRotorStatorClearances"
                                  ];
                                  List<String> dropList = [];
                                  Map<String, List<dynamic>> conMap = {
                                    Localozation.localization
                                        ? "Entry card"
                                        : "Карта входного контроля": [
                                      generateEntryCard,
                                      "Initial form"
                                    ],
                                    Localozation.localization
                                        ? "Test protocol before repair"
                                        : "Протокол электрических испытаний до ремонта": [
                                      generateProtocolBefore,
                                      "Initial form"
                                    ],
                                    Localozation.localization
                                        ? "Test protocol after repair"
                                        : "Протокол электрических испытаний после ремонта": [
                                      generateProtocolAfter,
                                      "Test after"
                                    ],
                                    Localozation.localization
                                        ? "Repair card"
                                        : "Карта ремотного процесса": [
                                      generateRepairCard,
                                      "Repair card"
                                    ],
                                    Localozation.localization
                                        ? "Rewinding card"
                                        : "Карта перемотки": [
                                      generateRewindingCard,
                                      "Rewinding card"
                                    ],
                                  };
                                  for (var key in data.keys) {
                                    if (stateListEntryCard.contains(key)) {
                                      if (data[key]) {
                                        if (!dropList.contains(
                                            Localozation.localization
                                                ? "Entry card"
                                                : "Карта входного контроля")) {
                                          dropList.add(Localozation.localization
                                              ? "Entry card"
                                              : "Карта входного контроля");
                                        }
                                      } else {
                                        dropList.remove(
                                            Localozation.localization
                                                ? "Entry card"
                                                : "Карта входного контроля");
                                        break;
                                      }
                                    }
                                  }
                                  data.forEach((key, value) {
                                    if (key == "testProtocolBefore" && value) {
                                      dropList.add(Localozation.localization
                                          ? "Test protocol before repair"
                                          : "Протокол электрических испытаний до ремонта");
                                    }
                                    if (key == "testProtocolAfter" && value) {
                                      dropList.add(Localozation.localization
                                          ? "Test protocol after repair"
                                          : "Протокол электрических испытаний после ремонта");
                                    }
                                    
                                    
                                    
                                    if (key == "repairCard" && value) {
                                      dropList.add(Localozation.localization
                                          ? "Repair card"
                                          : "Карта ремотного процесса");
                                    }
                                    if (key == "rewindingForm" && value) {
                                      dropList.add(Localozation.localization
                                          ? "Rewinding card"
                                          : "Карта перемотки");
                                    }
                                  });
                                  dropList.sort();
                                  return dropList.isNotEmpty
                                      ? Column(
                                          children: [
                                            ListView.builder(
                                              physics: const ScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: dropList.length,
                                              itemBuilder:
                                                  (buildContext, int index) {
                                                return Dismissible(
                                                    direction:
                                                        DismissDirection.none,
                                                    key: Key(dropList[index]),
                                                    child: Card(
                                                        margin: const EdgeInsets
                                                            .all(8),
                                                        elevation: 4,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0)),
                                                        child: ListTile(
                                                            title: Text(
                                                                dropList[
                                                                    index]),
                                                            trailing:
                                                                IconButton(
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .create_sharp,
                                                                      color: Colors
                                                                          .blue,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      for (var i
                                                                          in conMap
                                                                              .keys) {
                                                                        if (dropList[index] ==
                                                                            i) {
                                                                          if (await conMap[i]![0](
                                                                              "R:$requestNumber;SN:$serialNumber",
                                                                              conMap[i]![1])) {
                                                                            SnackBar(content: Text(Localozation.localization ? "Generation is completed" : "Генерация завершена")).show(context);
                                                                            Navigator.pop(context);
                                                                          } else {
                                                                            SnackBar(content: Text(Localozation.localization ? "Generation wasn't completed" : "Генерация не удалась")).show(context);
                                                                            Navigator.pop(context);
                                                                          }
                                                                        }
                                                                      }
                                                                    }))));
                                              },
                                            ),
                                          ],
                                        )
                                      : Center(
                                          child: Text(
                                              Localozation.localization
                                              ? "There is no filled documents try to fill it"
                                              : "Нет ни одного заполненного документа, заполните их",
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight:
                                                      FontWeight.bold)));
                                }
                                return const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Center(
                                        child: CircularProgressIndicator()));
                              },
                            ),
                        ])))));
  }
}
