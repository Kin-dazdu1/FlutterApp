import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:snack/snack.dart';
import 'package:work_shop_app/models/docx.dart';

class Generating extends StatefulWidget {
  const Generating({Key? key}) : super(key: key);
  @override
  State<Generating> createState() => _Generating();
}

class _Generating extends State<Generating> {
  final bar = SnackBar(
      content: Text(Localozation.localization
          ? "Generation is completed"
          : "Генерация завершена"));
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
                                  for (var i in data.values) {
                                    if (i is bool) {
                                      if (i == false) {
                                        return Center(
                                            child: Text(
                                                Localozation.localization
                                                    ? "Some forms is not filled yet"
                                                    : "Некоторые формы ещё не заполнены",
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)));
                                      }
                                    }
                                  }
                                  
                                  return Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20.0,
                                        horizontal: 20.0,
                                      ),
                                      child: Center(
                                          child: SizedBox(
                                        child: ElevatedButton(
                                          child: Text(Localozation.localization
                                              ? "Generate all"
                                              : "Сгенерировать"),
                                          style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder()),
                                          onPressed: () async {
                                            List<bool> results =
                                                await Future.wait([
                                              generateEntryCard(
                                                  "R:$requestNumber;SN:$serialNumber",
                                                  "Initial form"),
                                              generateProtocolBefore(
                                                  "R:$requestNumber;SN:$serialNumber",
                                                  "Initial form"),
                                              generateProtocolAfter(
                                                  "R:$requestNumber;SN:$serialNumber",
                                                  "Test after"),
                                              generateRepairCard(
                                                  "R:$requestNumber;SN:$serialNumber",
                                                  "Repair card"),
                                              generateRewindingCard(
                                                  "R:$requestNumber;SN:$serialNumber",
                                                  "Rewinding card"),
                                              generateExProofPoor(
                                                  "R:$requestNumber;SN:$serialNumber"),
                                            ]);
                                            if (!results.contains(false)) {
                                              bar.show(context);
                                              Navigator.pop(context);
                                            } else {
                                              barNotOk.show(context);
                                              Navigator.pop(context);
                                            }
                                          },
                                        ),
                                      )));
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
