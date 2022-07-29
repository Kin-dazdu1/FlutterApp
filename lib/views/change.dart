import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:snack/snack.dart';

class ChangeDocument extends StatefulWidget {
  const ChangeDocument({Key? key}) : super(key: key);
  @override
  State<ChangeDocument> createState() => _ChangeDocument();
}

class _ChangeDocument extends State<ChangeDocument> {
  final bar = SnackBar(content: Text(Localozation.localization ? "Generation is completed" : "Генерация завершена успешно"));
  final barNotOk = SnackBar(content: Text(Localozation.localization ? "Something has gone wrong" : "Что-то пошло не так"));
  String? requestNumber;
  String? serialNumber;
  bool saveSwitch = false;
  final _formKey = GlobalKey<FormState>();
  Map<String, String> stateDecode = {
    "rewindingForm": Localozation.localization ? "Rewinding card" : "Карта перемотки",
    "repairCard": Localozation.localization ? "Reapir card" : "Карта ремотного процесса",
    "entryTable": Localozation.localization ? "General information of entry card": "Входные данные карты входного контроля",
    "electricalMeasurement": Localozation.localization ? "Electrical measurement of entry card": "Электрические испытания",
    "visualInspectionMechanicalAndRotorStatorClearances":
        Localozation.localization ? "Mechanical visual inspection and mechanical checks": "Механическая визуальная проверка",
    "testProtocolAfter": Localozation.localization ? "Test protocol after repair": "Протокол испытания после ремонта",
    "exProofReport": Localozation.localization ? "Ex proof report": "Отчет по взрывозащите",
    "exDeMechanicalShaftFlame": Localozation.localization ? "Shaft flame path clearances": "Измерения зазоров в местах возможного прохождения пламени на валу",
    "exDeMechanicalCLearance": Localozation.localization ? "Clearance of end-shield bearing cover seat": "Измерение зазора посадочного места крышки подшипника в торцевом щите",
    "exDeMechanicalStatorEnd": Localozation.localization ? "Motor stator-end shield clearance": "Измерения зазора статор-торцевой щит",
    "exDeTerminalBox": Localozation.localization ? "Terminal box flame path clearances": "Измерение зазоров в местах возможного прохождения пламени на терминальной коробке",
    "visualInspectionElectrical": Localozation.localization ? "Visual inspection electrical part": "Визуальная испекция электрической части",
    "deviationActionNote": Localozation.localization ? "Deviations, actions, notes": "Неисправности, необходимые действия, заметки",
  };
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
                                      child: Text(Localozation.localization ? "Something went wrong" : "Что-то пошло не так",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)));
                                }
                                
                                if (document.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data =
                                      document.data!.map;
                                  List<String> dropList = [];
                                  for (var key in data.keys) {
                                    if (data[key] is bool &&
                                        data[key] &&
                                        key != "testProtocolBefore") {
                                      dropList.add(stateDecode[key]!);
                                    }
                                  }
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
                                                                          .content_paste_off,
                                                                      color: Colors
                                                                          .blue,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return AlertDialog(title: Center(child: Text(Localozation.localization ? "You are changing " : "Вы меняете " + dropList[index].toLowerCase())), content: Text(Localozation.localization ? "Are you sure? If you change document you have to refill it." : "Вы уверены? Если вы изменете документ его придеться перезаполнять", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red)), actions: <Widget>[
                                                                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                                                                ElevatedButton(
                                                                                  child: Text(Localozation.localization ? "Yes" : "Да"),
                                                                                  onPressed: () async {
                                                                                    String docName = "R:$requestNumber;SN:$serialNumber";
                                                                                    Map<String, dynamic> adjustMap = {};
                                                                                    for (var i in stateDecode.keys) {
                                                                                      if (dropList[index] == stateDecode[i]) {
                                                                                        adjustMap[i] = false;
                                                                                      }
                                                                                    }
                                                                                    await adjustData(adjustMap, docName);
                                                                                    SnackBar(content: Text(Localozation.localization ? "Document was deleted now you can refill it by adding document!" : "Документ был удален вы можете его перезаполнить через добавление документа")).show(context);
                                                                                    setState(() {
                                                                                    });
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                ),
                                                                                ElevatedButton(
                                                                                    child: Text(Localozation.localization ? "No" : "Нет"),
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    })
                                                                              ])
                                                                            ]);
                                                                          });
                                                                    }))));
                                              },
                                            ),
                                          ],
                                        )
                                      : Center(
                                          child: Text(
                                              Localozation.localization ? "There is no filled documents try to fill it" : "Не было найдено ни одного заполненного документа",
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

Future<void> adjustData(
    Map<String, dynamic> adjustedMap, String docName) async {
  CollectionReference data = Firestore.instance.collection('State');
  await data.document(docName).update(adjustedMap);
}
