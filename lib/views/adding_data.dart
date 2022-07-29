import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:work_shop_app/views/deviation_action_note.dart';
import 'package:work_shop_app/views/reapir_card.dart';
import 'package:work_shop_app/views/rewinding_card.dart';
import 'package:work_shop_app/views/test_protocol_after.dart';
import 'package:work_shop_app/views/visual_inspection_electrical.dart';
import 'ex_de_mechanical_clearance.dart';
import 'ex_de_terminal_box.dart';
import 'initial_form_async.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'electrical_measurment.dart';
import 'package:work_shop_app/views/visual_inspection_mechanical_and_rotor_stator_clearances.dart';
import 'ex_de_mechanical_shaft_flame.dart';
import 'ex_de_mechanical_stator_end.dart';
import 'navigation.dart';

class AddData extends StatefulWidget {
  @override
  _AddData createState() => _AddData();
  const AddData({Key? key}) : super(key: key);
}

class _AddData extends State<AddData> {
  final _formKey = GlobalKey<FormState>();
  String? requestNumber;
  String? serialNumber;
  String? initialDrop;
  List<String> dropList = [];
  Map<String, dynamic> stateMap = {};
  bool streamSwitch = false;
  bool futureSwitch = false;
  Map<String, List<dynamic>> stateKeyMap = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 53, 0, 211),
          title: const Text('Edil-Oral.kz'),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: Builder(
                builder: (context) =>
                    
                    Form(
                        key: _formKey,
                        child: ListView(
                          cacheExtent: 20000000,
                          children: [
                            CommonForm(
                              keyBoardType: TextInputType.text,
                              labelText: Localozation.localization ? "Requst number" : "Номер заявки",
                              emptyValue: Localozation.localization ? "Enter request number" : "Введите номер заявки",
                              textInputAction: TextInputAction.next,
                              onSaved: (value) =>
                                  setState(() => requestNumber = value),
                            ),
                            CommonForm(
                              keyBoardType: TextInputType.text,
                              labelText: Localozation.localization ? "Serial number": "Серийный номер",
                              emptyValue: Localozation.localization ? "Enter serial number" : "Введите серийный номер",
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
                                          child: Text(Localozation.localization ? "Check" : "Проверить"),
                                          style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder()),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              setState(() {
                                                futureSwitch = true;
                                                streamSwitch = false;
                                                stateKeyMap = {
                                                  "rewindingForm": [
                                                    Localozation.localization ? "Rewinding card" : "Карта перемотки",
                                                    RewindingCard(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                  "repairCard": [
                                                    Localozation.localization ? "Reapir card" : "Карта ремотного процесса",
                                                    RepairCard(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                  "entryTable": [
                                                    Localozation.localization ? "General information of entry card" : "Входные данные карты входного контроля",
                                                    InitialFormAsync(
                                                      requestNumber:
                                                          requestNumber!,
                                                      serialNumber:
                                                          serialNumber!,
                                                      addSwitch: true,
                                                    )
                                                  ],
                                                  "electricalMeasurement": [
                                                    Localozation.localization ? "Electrical measurement of entry card" : "Электрические испытания",
                                                    ElectricalMeasurment(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                  "visualInspectionMechanicalAndRotorStatorClearances":
                                                      [
                                                    Localozation.localization ? "Mechanical visual inspection and mechanical checks" : "Механическая визуальная проверка",
                                                    VisualInspectionMechanical(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                  "testProtocolAfter": [
                                                    Localozation.localization ? "Test protocol after repair"  : "Протокол испытания после ремонта",
                                                    TestProtocolAfter(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                  "exProofReport": [
                                                    Localozation.localization ? "Ex proof report" : "Отчет по взрывозащите",
                                                    const InitialWidget()
                                                  ],
                                                  "exDeMechanicalShaftFlame": [
                                                    Localozation.localization ? "Shaft flame path clearances" : "Измерения зазоров в местах возможного прохождения пламени на валу",
                                                    ExDeMechanicalShaftFlame(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                  "exDeMechanicalCLearance": [
                                                    Localozation.localization ? "Clearance of end-shield bearing cover seat" : "Измерение зазора посадочного места крышки подшипника в торцевом щите",
                                                    ExDeMechanicalClearance(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                  "exDeMechanicalStatorEnd": [
                                                    Localozation.localization ? "Motor stator-end shield clearance" : "Измерения зазора статор-торцевой щит",
                                                    ExDeMechanicalStatorEndShield(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                  "exDeTerminalBox": [
                                                    Localozation.localization ? "Terminal box flame path clearances" : "Измерение зазоров в местах возможного прохождения пламени на терминальной коробке",
                                                    ExDeTerminalBox(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                  "visualInspectionElectrical":
                                                      [
                                                    Localozation.localization ? "Visual inspection electrical part" : "Визуальная испекция электрической части",
                                                    VisualInspectionElctrical(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                  "deviationActionNote": [
                                                    Localozation.localization ? "Deviations, actions, notes" : "Неисправности, необходимые действия, заметки",
                                                    DeviationsActionsNotes(
                                                      docName:
                                                          "R:$requestNumber;SN:$serialNumber",
                                                    )
                                                  ],
                                                };
                                              });
                                            }
                                          }))),
                            ),
                            
                            
                            if (futureSwitch)
                              
                              
                              
                              FutureBuilder<Document>(
                                future: Firestore.instance
                                    .collection('State')
                                    .document(
                                        'R:$requestNumber;SN:$serialNumber')
                                    .get(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<Document> document) {
                                  if (document.hasError) {
                                    return Center(
                                        child: Text(Localozation.localization ? "Something went wrong" : "Что-то пошло не так",
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)));
                                  }
                                  
                                  if (document.connectionState ==
                                      ConnectionState.done) {
                                    
                                    Map<String, dynamic> stateMap =
                                        document.data!.map;
                                    
                                    if (!streamSwitch) {
                                      streamSwitch = true;
                                      initialDrop = null;
                                      dropList.clear();
                                      for (String i in stateMap.keys) {
                                        if (!stateMap[i] && i != "testProtocolBefore") {
                                          dropList.add(stateKeyMap[i]![0]);
                                          initialDrop ??
                                              (initialDrop =
                                                  stateKeyMap[i]![0]);
                                          dropList.sort();
                                        }
                                      }
                                    }
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
                                                          margin:
                                                              const EdgeInsets
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
                                                                            .add,
                                                                        color: Colors
                                                                            .blue,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        stateKeyMap.forEach((key,
                                                                            value) {
                                                                          if (value
                                                                              .contains(dropList[index])) {
                                                                            Navigator.pushReplacement(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => value[1]),
                                                                            );
                                                                          }
                                                                        });
                                                                      }))));
                                                },
                                              ),
                                            ],
                                          )
                                        : Center(
                                            child: Text(
                                                Localozation.localization ? "All documents are filled, you can start generating" : "Все документы заполнены, можете начинать генерацию",
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)));
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                              ),
                          ],
                        )))));
  }
}
