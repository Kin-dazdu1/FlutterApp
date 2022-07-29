import 'package:flutter/material.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:work_shop_app/models/ex_de_mechanical_shaft_flame_path_model.dart';
import 'package:snack/snack.dart';

class ExDeMechanicalShaftFlame extends StatefulWidget {
  final String docName;
  @override
  _ExDeMechanicalShaftFlame createState() => _ExDeMechanicalShaftFlame();
  const ExDeMechanicalShaftFlame({Key? key, required this.docName})
      : super(key: key);
}

class _ExDeMechanicalShaftFlame extends State<ExDeMechanicalShaftFlame> {
  final bar = SnackBar(
      content: Text(Localozation.localization
          ? "Data succesfully added"
          : "Данные успешно добавленны"));
  late final ExDeMechanicalShaftFlameModel _modelInstance =
      ExDeMechanicalShaftFlameModel(docName: widget.docName);
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
                                ? "Shaft flame path clearances"
                                : "Измерения зазоров в местах возможного прохождения пламени на валу (Ex d only) ",
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
                                      labelText: "DE",
                                      emptyValue: Localozation.localization
                                          ? "Enter type of flame path DE"
                                          : "Введите тип пламягастильного канала DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.typeOfFlamePathDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter type of flame path NDE"
                                          : "Введите тип пламягастильного канала NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.typeOfFlamePathNDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Note"
                                          : "Заметка",
                                      emptyValue: Localozation.localization
                                          ? "Enter note"
                                          : "Введите заметку",
                                      textInputAction: TextInputAction.done,
                                      validation: false,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.typeOfFlamePathNote =
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
                                      : "Длина пламягасительного канала: ",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Row(children: [
                            Flexible(
                                child: CommonForm(
                                    keyBoardType: TextInputType.text,
                                    labelText: "DE",
                                    emptyValue: Localozation.localization
                                        ? "Enter length of flame path DE"
                                        : "Введите длину пламягасительного канала DE",
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) => setState(() =>
                                        _modelInstance.lengthOfFlamePathDe =
                                            value!))),
                            Flexible(
                                child: CommonForm(
                                    keyBoardType: TextInputType.text,
                                    labelText: "NDE",
                                    emptyValue: Localozation.localization
                                        ? "Enter length of flame path NDE"
                                        : "Введите длину пламягасительного канала NDE",
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) => setState(() =>
                                        _modelInstance.lengthOfFlamePathNDe =
                                            value!))),
                            Flexible(
                                child: CommonForm(
                                    keyBoardType: TextInputType.text,
                                    labelText: Localozation.localization
                                        ? "Note"
                                        : "Заметка",
                                    emptyValue: Localozation.localization
                                        ? "Enter note"
                                        : "Введите заметку",
                                    textInputAction: TextInputAction.done,
                                    validation: false,
                                    onSaved: (value) => setState(() =>
                                        _modelInstance.lengthOfFlamePathNote =
                                            value!)))
                          ])),
                        ]),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(
                                    Localozation.localization
                                        ? "Diameter of flame path in internal-inner bearing cover: "
                                        : "Диаметр пламягасительного канала внутренней крышки подшипника: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "DE",
                                      emptyValue: Localozation.localization
                                          ? "Enter diameter of flame path in internal-inner bearing cover DE"
                                          : "Введите диаметр пламягасительного канала внутренней крышки подшипника DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.diametrOfFlamePathDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter diameter of flame path in internal-inner bearing cover NDE"
                                          : "Введите диаметр пламягасительного канала внутренней крышки подшипника NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.diametrOfFlamePathNDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Note"
                                          : "Заметка",
                                      emptyValue: Localozation.localization
                                          ? "Enter note"
                                          : "Введите заметку",
                                      textInputAction: TextInputAction.done,
                                      validation: false,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .diametrOfFlamePathNote =
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
                                        ? "Diameter of shaft on flame path: "
                                        : "Диаметр вала в месте пламягасительного канала: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "DE",
                                      emptyValue: Localozation.localization
                                          ? "Enter diameter of shaft on flame path DE"
                                          : "Введите диаметр вала в месте пламягасительного канала DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.diametrOfShaftDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter diameter of shaft on flame path NDE"
                                          : "Введите диаметр вала в месте пламягасительного канала NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.diametrOfShaftNDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Note"
                                          : "Заметка",
                                      emptyValue: Localozation.localization
                                          ? "Enter note"
                                          : "Введите заметку",
                                      textInputAction: TextInputAction.done,
                                      validation: false,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.diametrOfShaftNote =
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
                                      labelText: "DE",
                                      emptyValue: Localozation.localization
                                          ? "Enter diametral clearances DE"
                                          : "Введите диаметральный зазор DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.diametralclearancesDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter diametral clearances NDE"
                                          : "Введите диаметральный зазор NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .diametralclearancesNde =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Note"
                                          : "Заметка",
                                      emptyValue: Localozation.localization
                                          ? "Enter note"
                                          : "Введите заметку",
                                      textInputAction: TextInputAction.done,
                                      validation: false,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .diametralclearancesNote =
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
                                        : "Максимальный зазор согласно стандарта: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "DE",
                                      emptyValue: Localozation.localization
                                          ? "Enter maximum gap as per standard DE"
                                          : "Введите максимальный зазор согласно стандарту DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.maximumGapDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter maximum gap as per standard NDE"
                                          : "Введите максимальный зазор согласно стандарту NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.maximumGapNde =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Note"
                                          : "Заметка",
                                      emptyValue: Localozation.localization
                                          ? "Enter note"
                                          : "Введите заметку",
                                      textInputAction: TextInputAction.done,
                                      validation: false,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.maximumGapNote =
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
                            child: Text(Localozation.localization
                                ? "Save"
                                : "Сохранить"),
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
                          ))),
                        ),
                      ]))),
            )));
  }
}
