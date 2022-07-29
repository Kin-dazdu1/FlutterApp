import 'package:flutter/material.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:work_shop_app/models/ex_de_terminal_box.dart';
import 'package:snack/snack.dart';

class ExDeTerminalBox extends StatefulWidget {
  final String docName;
  @override
  _ExDeTerminalBox createState() => _ExDeTerminalBox();
  const ExDeTerminalBox({Key? key, required this.docName}) : super(key: key);
}

class _ExDeTerminalBox extends State<ExDeTerminalBox> {
  final bar = SnackBar(
      content: Text(Localozation.localization
          ? "Data succesfully added"
          : "Данные успешно добавленны"));
  late final ExDeTerminalBoxModel _modelInstance =
      ExDeTerminalBoxModel(docName: widget.docName);
  final _formKeyForms = GlobalKey<FormState>();
  Future<bool?> _showWarning(BuildContext context) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(Localozation.localization
                  ? "Data on that page won't be saved. Are you sure?"
                  : "Данные на этой странице будут потерянны. Вы уверены?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text(
                        Localozation.localization
                            ? "Yes, leave page"
                            : "Да, покинуть страницу",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(
                        Localozation.localization
                            ? "No, stay on page"
                            : "Нет, остаться на странице",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async {
          final _closePage = await _showWarning(context);
          return _closePage ?? false;
        },
        child: Scaffold(
          appBar: (AppBar(
            backgroundColor: const Color.fromARGB(255, 53, 0, 211),
            title: const Text('Edil-Oral.kz'),
          )),
          body: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Builder(
                  builder: (context) => Form(
                      key: _formKeyForms,
                      child: ListView(cacheExtent: 20000000, children: [
                        
                        Center(child: Text(
                            Localozation.localization
                                ? "Terminal box flame path clearances"
                                : "Измерение зазоров в местах возможного прохождения пламени на терминальной коробке (Ex d only)",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(
                                    Localozation.localization
                                        ? "Type of flame path: "
                                        : "Тип пламягасительного канала: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Term. box-cover"
                                          : "Терминальная коробка-крышка",
                                      emptyValue: Localozation.localization
                                          ? "Enter type of flame path term. box-cover"
                                          : "Введите тип пламягастильного канала терминальная коробка-крышка",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.typeOfFlamePathTBC =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Term. box-Intermediateplate"
                                          : "Терминальная коробка-промежуточная пластина",
                                      emptyValue: Localozation.localization
                                          ? "Enter type of flame path term. Box-Intermediateplate"
                                          : "Введите тип пламягасительного канала терминальная коробка-промежуточная пластина",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.typeOfFlamePathTBI =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Intermediate plate–stator frame"
                                          : "Промежуточная пластина-статор",
                                      emptyValue: Localozation.localization
                                          ? "Enter type of flame path intermediate plate–stator frame"
                                          : "Введите тип пламягасительного канала промежуточная пластина-статор",
                                      textInputAction: TextInputAction.done,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.typeOfFlamePathIPS =
                                              value!)))
                            ])),
                          ],
                        ),
                        
                        Row(children: [
                          SizedBox(
                              width: width / 7,
                              child: Text(
                                  Localozation.localization
                                      ? "Length of flame path: "
                                      : "Длина пламягаситльного канала",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Row(children: [
                            Flexible(
                                child: CommonForm(
                                    keyBoardType: TextInputType.text,
                                    labelText: Localozation.localization
                                        ? "Term. box-cover"
                                        : "Терминальная коробка-крышка",
                                    emptyValue: Localozation.localization
                                        ? "Enter lenght of flame path term. box-cover"
                                        : "Введите длину пламягастильного канала терминальная коробка-крышка",
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) => setState(() =>
                                        _modelInstance.lenghtOfFlamePathTBC =
                                            value!))),
                            Flexible(
                                child: CommonForm(
                                    keyBoardType: TextInputType.text,
                                    labelText: Localozation.localization
                                          ? "Term. box-Intermediate plate"
                                          : "Терминальная коробка-промежуточная пластина",
                                      emptyValue: Localozation.localization
                                          ? "Enter lenght of flame path term. Box-Intermediateplate"
                                          : "Введите длину пламягасительного канала терминальная коробка-промежуточная пластина",
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) => setState(() =>
                                        _modelInstance.lenghtOfFlamePathTBI =
                                            value!))),
                            Flexible(
                                child: CommonForm(
                                    keyBoardType: TextInputType.text,
                                    labelText: Localozation.localization
                                          ? "Intermediate plate–stator frame"
                                          : "Промежуточная пластина-статор",
                                      emptyValue: Localozation.localization
                                          ? "Enter lenght of flame path intermediate plate–stator frame"
                                          : "Введите длину пламягасительного канала промежуточная пластина-статор",
                                    textInputAction: TextInputAction.done,
                                    onSaved: (value) => setState(() =>
                                        _modelInstance.lenghtOfFlamePathIPS =
                                            value!)))
                          ])),
                        ]),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(Localozation.localization
                                ? "Diameter of flame path: "
                                : "Диаметр пламягасительного канала: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                        ? "Term. box-cover"
                                        : "Терминальная коробка-крышка",
                                    emptyValue: Localozation.localization
                                        ? "Enter diametr of flame path term. box-cover"
                                        : "Введите диаметр пламягастильного канала терминальная коробка-крышка",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.diametrOfFlamePathTBC =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Term. box-Intermediate plate"
                                          : "Терминальная коробка-промежуточная пластина",
                                      emptyValue: Localozation.localization
                                          ? "Enter diametr of flame path term. Box-Intermediateplate"
                                          : "Введите диаметр пламягасительного канала терминальная коробка-промежуточная пластина",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.diametrOfFlamePathTBI =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Intermediate plate–stator frame"
                                          : "Промежуточная пластина-статор",
                                      emptyValue: Localozation.localization
                                          ? "Enter diametr of flame path intermediate plate–stator frame"
                                          : "Введите диаметр пламягасительного канала промежуточная пластина-статор",
                                      textInputAction: TextInputAction.done,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.diametrOfFlamePathIPS =
                                              value!)))
                            ])),
                          ],
                        ),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(Localozation.localization
                                          ? "Diametral clearances: "
                                          : "Диаметральный зазор: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                        ? "Term. box-cover"
                                        : "Терминальная коробка-крышка",
                                    emptyValue: Localozation.localization
                                        ? "Enter diametr clearances of flame path term. box-cover"
                                        : "Введите диаметральный зазор пламягастильного канала терминальная коробка-крышка",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .diametrOfClearancesTBC =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Term. box-Intermediate plate"
                                          : "Терминальная коробка-промежуточная пластина",
                                      emptyValue: Localozation.localization
                                          ? "Enter diametr clearances of flame path term. Box-Intermediateplate"
                                          : "Введите диаметральный зазор пламягасительного канала терминальная коробка-промежуточная пластина",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .diametrOfClearancesTBI =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Intermediate plate–stator frame"
                                          : "Промежуточная пластина-статор",
                                      emptyValue: Localozation.localization
                                          ? "Enter diametr clearances of flame path intermediate plate–stator frame"
                                          : "Введите диаметральный зазор пламягасительного канала промежуточная пластина-статор",
                                      textInputAction: TextInputAction.done,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .diametrOfClearancesIPS =
                                              value!)))
                            ])),
                          ],
                        ),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(
                                    Localozation.localization
                                        ? "Maximum gap as per standard: "
                                        : "Максимальный зазор согласно стандарту: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                        ? "Term. box-cover"
                                        : "Терминальная коробка-крышка",
                                    emptyValue: Localozation.localization
                                        ? "Enter maximum gap as per standart of flame path term. box-cover"
                                        : "Введите максимальный зазор согласно стандарту пламягастильного канала терминальная коробка-крышка",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.maximumGapTBC =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Term. box-Intermediate plate"
                                          : "Терминальная коробка-промежуточная пластина",
                                      emptyValue: Localozation.localization
                                          ? "Enter maximum gap as per standart of flame path term. Box-Intermediateplate"
                                          : "Введите максимальный зазор согласно стандарту пламягасительного канала терминальная коробка-промежуточная пластина",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.maximumGapTBI =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Intermediate plate–stator frame"
                                          : "Промежуточная пластина-статор",
                                      emptyValue: Localozation.localization
                                          ? "Enter maximum gap as per standart of flame path intermediate plate–stator frame"
                                          : "Введите максимальный зазор согласно стандарту пламягасительного канала промежуточная пластина-статор",
                                      textInputAction: TextInputAction.done,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.maximumGapIPS =
                                              value!)))
                            ])),
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
                                child: Text(Localozation.localization ? "Save" : "Сохранить"),
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder()),
                                onPressed: () {
                                  if (_formKeyForms.currentState!.validate()) {
                                    _formKeyForms.currentState!.save();
                                    _modelInstance.sendData();
                                    bar.show(context);
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ))),
                      ])))),
        ));
  }
}
