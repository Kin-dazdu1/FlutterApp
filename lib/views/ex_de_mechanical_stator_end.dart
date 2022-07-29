import 'package:flutter/material.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:work_shop_app/models/ex_de_stator_end_shield_clearance_model.dart';
import 'package:snack/snack.dart';

class ExDeMechanicalStatorEndShield extends StatefulWidget {
  final String docName;
  @override
  _ExDeMechanicalStatorEndShield createState() =>
      _ExDeMechanicalStatorEndShield();
  const ExDeMechanicalStatorEndShield({Key? key, required this.docName})
      : super(key: key);
}

class _ExDeMechanicalStatorEndShield
    extends State<ExDeMechanicalStatorEndShield> {
  final bar = SnackBar(
      content: Text(Localozation.localization
          ? "Data succesfully added"
          : "Данные успешно добавленны"));
  late final ExDeMechanicalStatorEndModel _modelInstance =
      ExDeMechanicalStatorEndModel(docName: widget.docName);
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
                                ? "Motor stator-end shield clearance"
                                : "Измерения зазора статор-торцевойщит (Ex d only)",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(
                                    Localozation.localization
                                        ? "Type of flame path: "
                                        : "Тип пламягасительного канала",
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
                                          : "Введите тип пламягасительного канала DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .shieldTypeOfFlamePathDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter type of flame path NDE"
                                          : "Введите тип пламягасительного канала NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .shieldTypeOfFlamePathNDe =
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
                                                  .shieldTypeOfFlamePathNote =
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
                                    labelText: "DE",
                                    emptyValue: Localozation.localization
                                        ? "Enter length of flame path DE"
                                        : "Введите длину пламягасительного канала DE",
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) => setState(() =>
                                        _modelInstance
                                                .shieldLengthOfFlamePathDe =
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
                                        _modelInstance
                                                .shieldLengthOfFlamePathNDe =
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
                                                .shieldLengthOfFlamePathNote =
                                            value!)))
                          ])),
                        ]),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(
                                    Localozation.localization
                                        ? "Max. Diameter of motor stator seat: "
                                        : "Макс. диаметр посадочной поверхности статора: ",
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
                                          ? "Enter max. Diameter of motor stator seat DE"
                                          : "Введите макс. диаметр посадочной поверхности статора DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.maxDiametrOfMotorDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter max. Diameter of motor stator seat NDE"
                                          : "Введите макс. диаметр посадочной поверхности статора NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.maxDiametrOfMotorNDe =
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
                                          _modelInstance.maxDiametrOfMotorNote =
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
                                        ? "Min. Diameter of end-shield seat: "
                                        : "Мин. диаметр посадочной поверхности торцевого щита: ",
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
                                          ? "Enter min. Diameter of end-shield seat DE"
                                          : "Введите мин. диаметр посадочной поверхности торцевого щита DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.minDiametrOfEndDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter min. Diameter of end-shield seat NDE"
                                          : "Введите мин. диаметр посадочной поверхности торцевого щита NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.minDiametrOfEndNDe =
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
                                          _modelInstance.minDiametrOfEndNote =
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
                                        ? "Measured clearance: "
                                        : "Измеренный зазор: ",
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
                                          ? "Enter measured clearance DE"
                                          : "Введите измеренный зазор DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .shaftMeasuredClearanceDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter measured clearance NDE"
                                          : "Введите измеренный зазор NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .shaftMeasuredClearanceNde =
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
                                                  .shaftMeasuredClearanceNote =
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
                                          _modelInstance.shaftMaximumGapDe =
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
                                          _modelInstance.shaftMaximumGapNde =
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
                                          _modelInstance.shaftMaximumGapNote =
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
                              ),
                            ))),
                      ])))),
        ));
  }
}
