import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:work_shop_app/views/change.dart';
import 'package:work_shop_app/views/generate_one_form.dart';
import 'adding_data.dart';
import 'login.dart';
import 'creating_new.dart';
import 'generation_all.dart';
import 'package:snack/snack.dart';

class InitialWidget extends StatefulWidget {
  const InitialWidget({Key? key}) : super(key: key);
  @override
  State<InitialWidget> createState() => _InitialWidget();
}

class _InitialWidget extends State<InitialWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          backgroundColor: const Color.fromARGB(255, 53, 0, 211),
          title: const Text('Edil-Oral.kz'),
          actions: <Widget>[
            PopupMenuButton(
                icon: const Icon(Icons.language),
                onSelected: (value) => {
                      setState(() {}),
                      if (value == false)
                        {Localozation.localization = false}
                      else
                        {Localozation.localization = true}
                    },
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          value: true,
                          child: (Text("ENG",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)))),
                      const PopupMenuItem(
                          value: false,
                          child: Text("RU",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)))
                    ]),
            // removed logout button
            // IconButton(
            //   icon: const Icon(Icons.logout),
            //   tooltip: "Log out",
            //   onPressed: () async {
            //     SharedPreferences preferences =
            //         await SharedPreferences.getInstance();
            //     preferences.remove("email");
            //     Navigator.pushReplacement(context,
            //         MaterialPageRoute(builder: (context) => const AuthGate()));
            //     const SnackBar(content: Text("Successfully logged out"))
            //         .show(context);
            //   },
            // ),
          ],
        )),
        body: ListView(children: [
          FutureBuilder<List<DataRow>>(
            future: getMap(),
            builder:
                (BuildContext context, AsyncSnapshot<List<DataRow>> document) {
              if (document.hasError) {
                return const Center(
                    child: Text("Something went wrong",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)));
              }
              
              if (document.connectionState == ConnectionState.done) {
                return DataTable(columns: [
                  DataColumn(
                      label: Text(
                          Localozation.localization
                              ? "Request number"
                              : "Номер заявки",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text(
                          Localozation.localization
                              ? "Serial number"
                              : "Серийный номер",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text(
                          Localozation.localization
                              ? "Manufacturer"
                              : "Производитель",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text(
                          Localozation.localization ? "Progress" : "Прогресс",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold))),
                ], rows: document.data!);
              }
              return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()));
            },
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Center(
                  child: SizedBox(
                      child: ElevatedButton.icon(
                          icon: const Icon(Icons.add),
                          label: Text(Localozation.localization
                              ? "Add new equipment"
                              : "Добавить обородувание"),
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateNewObject()),
                              
                              
                            ).then((value) => {setState(() {})});
                          }))),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Center(
                child: SizedBox(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.file_open_outlined),
                        label: Text(Localozation.localization
                            ? "Fill document"
                            : "Заполнить документ"),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddData()),
                          ).then((value) => {setState(() {})});
                        })),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Center(
                child: SizedBox(
                    child: ElevatedButton.icon(
                        icon: const Icon(Icons.refresh),
                        label: Text(Localozation.localization
                            ? "Refill document"
                            : "Перезаполнить документ"),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChangeDocument()),
                          ).then((value) => {setState(() {})});
                        })),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Center(
                  child: SizedBox(
                child: ElevatedButton.icon(
                    icon: const Icon(Icons.document_scanner_outlined),
                    label: Text(Localozation.localization
                        ? "Generate all docx"
                        : "Сгенерироваить все документы"),
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Generating()),
                      ).then((value) => {setState(() {})});
                    }),
              )),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Center(
                  child: SizedBox(
                child: ElevatedButton.icon(
                    icon: const Icon(Icons.add_chart),
                    label: Text(Localozation.localization
                        ? "Generate one docx"
                        : "Сгенерировать один документ"),
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GeneratingOne()),
                      ).then((value) => {setState(() {})});
                    }),
              )),
            ),
            ],
          )
        ]));
  }
}

Future<List<DataRow>> getMap() async {
  Map<String, dynamic>? dataMap = {};
  CollectionReference referenceIF =
      Firestore.instance.collection("Initial form");
  CollectionReference referenceS = Firestore.instance.collection("State");
  List<Document> documentIF = await referenceIF
      .orderBy("entryTable.time", descending: true)
      .limit(10)
      .get();
  List<Document> documentS = await referenceS.get();
  for (int i = 0; i < documentIF.length; i++) {
    dataMap.addAll({documentIF[i].id: documentIF[i].map["entryTable"]});
    dataMap[documentIF[i].id].addAll({
      "state":
          documentS.where((element) => element.id == documentIF[i].id).first.map
    });
  }
  List<List<String>> dataList = [];
  List<DataRow> dataRowList = [];
  dataMap.forEach((key, value) {
    List<String> temp = [];
    int stateIncopleted = 0;
    int stateCompleted = 0;
    temp.add(value["requestNumber"]);
    temp.add(value["serialNumber"]);
    temp.add(value["manufacturer"]);
    for (var i in value["state"].values) {
      if (i == true) {
        stateCompleted++;
      }
      if (i is bool) {
        stateIncopleted++;
      }
    }
    temp.add("$stateCompleted/$stateIncopleted");
    if (temp.isNotEmpty) {
      dataList.add(temp);
    }
  });
  for (int i = 0; i < dataList.length; i++) {
    dataRowList.add(DataRow(cells: [
      DataCell(Text(dataList[i][0])),
      DataCell(Text(dataList[i][1])),
      DataCell(Text(dataList[i][2])),
      DataCell(Text(dataList[i][3])),
    ]));
  }
  return dataRowList;
}
