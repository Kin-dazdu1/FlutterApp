import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:work_shop_app/models/test_after.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:snack/snack.dart';

class TestProtocolAfter extends StatefulWidget {
  final String docName;
  @override
  _TestProtocolAfter createState() => _TestProtocolAfter();
  const TestProtocolAfter({Key? key, required this.docName}) : super(key: key);
}

class _TestProtocolAfter extends State<TestProtocolAfter> {
  late final TestProtocolAfterModel _modelInstance =
      TestProtocolAfterModel(docName: widget.docName);
  final _formKeyAlertForms = GlobalKey<FormState>();
  final _formKeyForms = GlobalKey<FormState>();
  final bar = const SnackBar(content: Text("Data succesfully added"));
  
  RegExp regexTestVoltage =
      RegExp(r"(\d+\.\d+ ?V)|(\d+\.\d+ ?kV)|(\d+ ?V)|(\d+ ?kV)");
  
  RegExp regWResistence = RegExp(
      r"((\d+ ?Ohm)|(\d+\.\d+ ?Ohm)|(\d+ ?mOhm)|(\d+\.\d+ ?mOhm))|(N/A)");
  
  RegExp regInsRes = RegExp(
      r"((\d+ ?MOhm)|(\d+\.\d+ ?MOhm)|(\d+ ?GOhm)|(\d+\.\d+ ?GOhm))|(N/A)|(< ?\d+ ?kOhm)");
  
  RegExp ptcRTDHEresistence =
      RegExp(r"(\d+ ?Ohm)|(\d+\.\d+ ?Ohm)|(\d+ ?kOhm)|(\d+\.\d+ ?kOhm)");
  
  RegExp regexCurrent = RegExp(r"(\d+ ?A)|(\d+\.\d+ ?A)");
  
  RegExp regexRpm = RegExp(r"(\d+ ?RPM)|(\d+\.\d+ ?RPM)");
  bool ifMotorHighVoltage = false;
  bool flag = false;
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: Builder(builder: (context) {
                    return Form(
                        key: _formKeyForms,
                        child: ListView(cacheExtent: 20000000, children: [
                          SwitchListTile(
                              title: Text(
                                  Localozation.localization
                                      ? "High voltage motor"
                                      : "Высоковольный мотор",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              value: ifMotorHighVoltage,
                              onChanged: (bool value) => setState(
                                  () => ifMotorHighVoltage = value)),
                          
                          Center(
                              child: Text(
                                  Localozation.localization
                                      ? "Test protocol after repair"
                                      : "Протокол испытаний после ремонта",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Test voltage"
                                : "Напряжение испытания",
                            emptyValue: Localozation.localization
                                ? "Enter test voltage"
                                : "Введите напряжение испытания",
                            regEx: regexTestVoltage,
                            regExFormat: Localozation.localization
                                ? "valid format: 1000 V or 100kV"
                                : "Принимаемый формат: 1000V или 100 kV",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.testVoltage =
                                    regexTestVoltage.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of each phase U1-U2"
                                : "Сопротивление каждой фазы U1-U2",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление каждой фазы U1-U2",
                            regEx: regWResistence,
                            regExFormat: Localozation.localization
                                ? "valid format: 100Ohm or 100 mOhm"
                                : "Принимаемый формат: 100Ohm или 100 mOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceUUA =
                                    regWResistence.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of each phase V1-V2"
                                : "Сопротивление каждой фазы V1-V2",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление каждой фазы U1-U2",
                            regEx: regWResistence,
                            regExFormat: Localozation.localization
                                ? "valid format: 100Ohm or 100 mOhm"
                                : "Принимаемый формат: 100Ohm или 100 mOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceVVA =
                                    regWResistence.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of each phase W1-W2"
                                : "Сопротивление каждой фазы W1-W2",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление каждой фазы W1-W2",
                            regEx: regWResistence,
                            regExFormat: Localozation.localization
                                ? "valid format: 100Ohm or 100 mOhm"
                                : "Принимаемый формат: 100Ohm или 100 mOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceWWA =
                                    regWResistence.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Common insulation resistence of winding"
                                : "Общее сопротивление обмокти двигателя",
                            emptyValue: Localozation.localization
                                ? "Enter common insulation resistence of winding in valid format"
                                : "Введите общее сопротивление обмокти двигателя",
                            regEx: regInsRes,
                            regExFormat: Localozation.localization
                                ? "valid format: 100OMhm or 100 GOhm"
                                : "Принимаемый формат: 100OMhm или 100 GOhm",
                            textInputAction: TextInputAction.done,
                            onSaved: (value) => setState(() =>
                                _modelInstance.commonResistenceA =
                                    regInsRes.stringMatch(value!)),
                          ),
                          
                          if (ifMotorHighVoltage == true)
                            CommonForm(
                              keyBoardType: TextInputType.text,
                              labelText: Localozation.localization
                                  ? "Insulation resistance after 15 seconds"
                                  : "Сопротивление изоляции обмокти после 15 секунд",
                              emptyValue: Localozation.localization
                                  ? "Enter insulation resistance after 15 seconds in valid format"
                                  : "Введите сопротивление изоляции обмокти после 15 секунд",
                              regEx: regInsRes,
                              regExFormat: Localozation.localization
                                  ? "valid format: 100OMhm or 100 GOhm"
                                  : "Принимаемый формат: 100OMhm или 100 GOhm",
                              textInputAction: TextInputAction.done,
                              onSaved: (value) => setState(() =>
                                  _modelInstance.resistence15 =
                                      regInsRes.stringMatch(value!)!),
                            ),
                          
                          if (ifMotorHighVoltage == true)
                            CommonForm(
                              keyBoardType: TextInputType.text,
                              labelText: Localozation.localization
                                  ? "Insulation resistance after 60 seconds"
                                  : "Сопротивление изоляции обмокти после 60 секунд",
                              emptyValue: Localozation.localization
                                  ? "Enter insulation resistance after 60 seconds in valid format"
                                  : "Введите сопротивление изоляции обмокти после 60 секунд",
                              regEx: regInsRes,
                              regExFormat: Localozation.localization
                                  ? "valid format: 100OMhm or 100 GOhm"
                                  : "Принимаемый формат: 100OMhm или 100 GOhm",
                              textInputAction: TextInputAction.done,
                              onSaved: (value) => setState(() =>
                                  _modelInstance.resistence60 =
                                      regInsRes.stringMatch(value!)!),
                            ),
                          
                          if (ifMotorHighVoltage == true)
                            CommonForm(
                              keyBoardType: TextInputType.number,
                              labelText: Localozation.localization
                                  ? "Absorption coefficient"
                                  : "Коэффициент абсорбции",
                              emptyValue: Localozation.localization
                                  ? "Enter absorption coefficient"
                                  : "Введите коэффициент абсорбции",
                              textInputAction: TextInputAction.done,
                              onSaved: (value) => setState(() => _modelInstance
                                  .absorptionCoefficient = value!),
                            ),
                          
                          ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _modelInstance.heatersA.length,
                            itemBuilder: (buildContext, int index) {
                              return Dismissible(
                                  direction: DismissDirection.none,
                                  key: Key(_modelInstance.heatersA[index]),
                                  child: Card(
                                      margin: const EdgeInsets.all(8),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: ListTile(
                                          title: Text(
                                              _modelInstance.heatersA[index]),
                                          trailing: IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _modelInstance.heatersA
                                                      .removeAt(index);
                                                });
                                              }))));
                            },
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
                                      ? "Add heater"
                                      : "Добавить нагреватель"),
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder()),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                              child: Form(
                                                  key: _formKeyAlertForms,
                                                  child: ListView(
                                                    children: [
                                                      SizedBox(
                                                        height: 50,
                                                        child: Center(
                                                            child: Text(
                                                                Localozation
                                                                        .localization
                                                                    ? "Enter measurements"
                                                                    : "Введите измерения",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType.text,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "Heater name"
                                                            : "Название нагревателя",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Valid format: HE1"
                                                            : "Принимаемый формат: HE1",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) => setState(
                                                            () => _modelInstance
                                                                .heName = RegExp(
                                                                    r"HE\d{1}")
                                                                .stringMatch(
                                                                    value!)),
                                                        regEx:
                                                            RegExp(r"HE\d{1}"),
                                                        regExFormat: Localozation
                                                                .localization
                                                            ? "Valid format: HE1"
                                                            : "Принимаемый формат: HE1",
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType.text,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "Heater resistance"
                                                            : "Сопротивление нагревателя",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Valid format: 125 Ohm or kOhm"
                                                            : "Принимаемый формат: 125 Ohm или kOhm",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) => setState(
                                                            () => _modelInstance
                                                                    .heResistance =
                                                                ptcRTDHEresistence
                                                                    .stringMatch(
                                                                        value!)),
                                                        regEx:
                                                            ptcRTDHEresistence,
                                                        regExFormat: Localozation
                                                                .localization
                                                            ? "Valid format: 125 Ohm or kOhm"
                                                            : "Принимаемый формат: 125 Ohm или kOhm",
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType.text,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "Insulation on winding"
                                                            : "Сопротивление на обмотку",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Valid format: 125 GOhm or MOhm"
                                                            : "Принимаемый формат: 125 GOhm или MOhm",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) => setState(
                                                            () => _modelInstance
                                                                    .heInsulationResistanceWinding =
                                                                regInsRes
                                                                    .stringMatch(
                                                                        value!)),
                                                        regEx: regInsRes,
                                                        regExFormat:
                                                            "125 GOhm, 0.125 MOhm",
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType.text,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "Insulation on earth"
                                                            : "Сопротивление на землю",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Valid format: 125 GOhm or MOhm"
                                                            : "Принимаемый формат: 125 GOhm или MOhm",
                                                        textInputAction:
                                                            TextInputAction
                                                                .done,
                                                        onSaved: (value) => setState(
                                                            () => _modelInstance
                                                                    .heInsulationResistanceEarth =
                                                                regInsRes
                                                                    .stringMatch(
                                                                        value!)),
                                                        regEx: regInsRes,
                                                        regExFormat:
                                                            "125 GOhm, 0.125 MOhm",
                                                      ),
                                                      Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            vertical: 20.0,
                                                            horizontal: 20.0,
                                                          ),
                                                          child: Center(
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(Localozation
                                                                      .localization
                                                                  ? "Save"
                                                                  : "Сохранить"),
                                                              onPressed: () {
                                                                if (_formKeyAlertForms
                                                                    .currentState!
                                                                    .validate()) {
                                                                  _formKeyAlertForms
                                                                      .currentState!
                                                                      .save();
                                                                  setState(() {
                                                                    _modelInstance.heatersA.add(_modelInstance.heName! +
                                                                        " = " +
                                                                        _modelInstance
                                                                            .heResistance! +
                                                                        "\n" +
                                                                        _modelInstance
                                                                            .heName! +
                                                                        "winding = " +
                                                                        _modelInstance
                                                                            .heInsulationResistanceWinding! +
                                                                        "\n" +
                                                                        _modelInstance
                                                                            .heName! +
                                                                        "earth = " +
                                                                        _modelInstance
                                                                            .heInsulationResistanceEarth!);
                                                                    _modelInstance
                                                                        .heatersA
                                                                        .sort();
                                                                  });
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ))
                                                    ],
                                                  )));
                                        });
                                  },
                                ),
                              ))),
                          
                          ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _modelInstance.measurments.length,
                            itemBuilder: (buildContext, int index) {
                              return Dismissible(
                                  direction: DismissDirection.none,
                                  key: Key(_modelInstance.measurments[index]),
                                  child: Card(
                                      margin: const EdgeInsets.all(8),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: ListTile(
                                          title: Text(_modelInstance
                                              .measurments[index]),
                                          trailing: IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _modelInstance.measurments
                                                      .removeAt(index);
                                                });
                                              }))));
                            },
                          ),
                          
                          if (_modelInstance.measurments.length < 7)
                            Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 20.0,
                                ),
                                child: Center(
                                    child: SizedBox(
                                  child: ElevatedButton(
                                    child: Text(Localozation.localization
                                        ? "Add measurement"
                                        : "Добавить измерение"),
                                    style: ElevatedButton.styleFrom(
                                        shape: const StadiumBorder()),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              child: Form(
                                                  key: _formKeyAlertForms,
                                                  child: ListView(
                                                    children: [
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        child: Center(
                                                            child: Text(
                                                                Localozation
                                                                        .localization
                                                                    ? "Enter measurements"
                                                                    : "Введите измерения",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType
                                                                .number,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "Passed time from the start of the test"
                                                            : "Прошедшее время со старта теста",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Enter passed time from the start of the test"
                                                            : "Введите прошедшее время со старта теста",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) =>
                                                            setState(() =>
                                                                _modelInstance
                                                                        .time =
                                                                    value!
                                                                        .trim()),
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType
                                                                .number,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "Ambient temperature"
                                                            : "Температура окружающей среды",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Enter ambient temperature"
                                                            : "Введите температуру окружающей среды",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) => setState(
                                                            () => _modelInstance
                                                                    .ambientTemp =
                                                                value!.trim()),
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType.text,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "Current in phase A"
                                                            : "Ток фазы А",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Valid format: 125 A"
                                                            : "Принимаемый формат: 125 А",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) => setState(
                                                            () => _modelInstance
                                                                    .currentA =
                                                                regexCurrent
                                                                    .stringMatch(
                                                                        value!)!),
                                                        regEx: regexCurrent,
                                                        regExFormat:
                                                            "100 A 100A",
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType.text,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "Current in phase В"
                                                            : "Ток фазы В",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Valid format: 125 A"
                                                            : "Принимаемый формат: 125 А",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) => setState(
                                                            () => _modelInstance
                                                                    .currentB =
                                                                regexCurrent
                                                                    .stringMatch(
                                                                        value!)!),
                                                        regEx: regexCurrent,
                                                        regExFormat:
                                                            "100 A 100A",
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType.text,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "Current in phase С"
                                                            : "Ток фазы С",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Valid format: 125 A"
                                                            : "Принимаемый формат: 125 А",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) => setState(
                                                            () => _modelInstance
                                                                    .currentC =
                                                                regexCurrent
                                                                    .stringMatch(
                                                                        value!)!),
                                                        regEx: regexCurrent,
                                                        regExFormat:
                                                            "100 A 100A",
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType.text,
                                                        labelText: "RPM",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Enter RPM"
                                                            : "Введите RPM",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) => setState(
                                                            () => _modelInstance
                                                                    .rpm =
                                                                regexRpm
                                                                    .stringMatch(
                                                                        value!)!),
                                                        regEx: regexRpm,
                                                        regExFormat:
                                                            "50 RPM 50RPM",
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType
                                                                .number,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "NDE temperature"
                                                            : "Температура NDE",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Enter NDE temperature"
                                                            : "Введите температуру NDE",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) =>
                                                            setState(() =>
                                                                _modelInstance
                                                                        .tempNDE =
                                                                    value!
                                                                        .trim()),
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType
                                                                .number,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "Frame temperature"
                                                            : "Темература корпуса",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Enter frame temperature"
                                                            : "Введите темературу корпуса",
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        onSaved: (value) => setState(
                                                            () => _modelInstance
                                                                    .tempFrame =
                                                                value!.trim()),
                                                      ),
                                                      CommonForm(
                                                        keyBoardType:
                                                            TextInputType
                                                                .number,
                                                        labelText: Localozation
                                                                .localization
                                                            ? "DE temperature"
                                                            : "Температура DE",
                                                        emptyValue: Localozation
                                                                .localization
                                                            ? "Enter DE temperature"
                                                            : "Введите температуру DE",
                                                        textInputAction:
                                                            TextInputAction
                                                                .done,
                                                        onSaved: (value) =>
                                                            setState(() =>
                                                                _modelInstance
                                                                        .tempDE =
                                                                    value!
                                                                        .trim()),
                                                      ),
                                                      if (ifMotorHighVoltage ==
                                                          true)
                                                        CommonForm(
                                                          keyBoardType:
                                                              TextInputType
                                                                  .number,
                                                          labelText: Localozation
                                                                  .localization
                                                              ? "Yellow phase temp"
                                                              : "Температура желтой фазы",
                                                          emptyValue: Localozation
                                                                  .localization
                                                              ? "Enter yellow phase temp"
                                                              : "Введите температуру желтой фазы",
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          onSaved: (value) =>
                                                              setState(() =>
                                                                  _modelInstance
                                                                          .yellowPT =
                                                                      value!
                                                                          .trim()),
                                                        ),
                                                      if (ifMotorHighVoltage ==
                                                          true)
                                                        CommonForm(
                                                          keyBoardType:
                                                              TextInputType
                                                                  .number,
                                                          labelText: Localozation
                                                                  .localization
                                                              ? "Green phase temp"
                                                              : "Температура зелёной фазы",
                                                          emptyValue: Localozation
                                                                  .localization
                                                              ? "Enter green phase temp"
                                                              : "Введите температуру зелёной фазы",
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          onSaved: (value) =>
                                                              setState(() =>
                                                                  _modelInstance
                                                                          .greenPT =
                                                                      value!
                                                                          .trim()),
                                                        ),
                                                      if (ifMotorHighVoltage ==
                                                          true)
                                                        CommonForm(
                                                          keyBoardType:
                                                              TextInputType
                                                                  .number,
                                                          labelText: Localozation
                                                                  .localization
                                                              ? "Red phase temp"
                                                              : "Температура красной фазы",
                                                          emptyValue: Localozation
                                                                  .localization
                                                              ? "Enter red phase temp"
                                                              : "Введите температуру красной фазы",
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          onSaved: (value) =>
                                                              setState(() =>
                                                                  _modelInstance
                                                                          .redPT =
                                                                      value!
                                                                          .trim()),
                                                        ),
                                                      Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            vertical: 20.0,
                                                            horizontal: 20.0,
                                                          ),
                                                          child: Center(
                                                              child: SizedBox(
                                                            child:
                                                                ElevatedButton(
                                                              child: Text(Localozation
                                                                      .localization
                                                                  ? "Add"
                                                                  : "Добавить"),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      shape:
                                                                          const StadiumBorder()),
                                                              onPressed: () {
                                                                if (_formKeyAlertForms
                                                                    .currentState!
                                                                    .validate()) {
                                                                  _formKeyAlertForms
                                                                      .currentState!
                                                                      .save();
                                                                  setState(() {
                                                                    if (ifMotorHighVoltage){
                                                                      _modelInstance.measurments.add("Time: " +
                                                                        _modelInstance
                                                                            .time! +
                                                                        "\n" +
                                                                        "Current in phase A: " +
                                                                        _modelInstance
                                                                            .currentA! +
                                                                        "\n" +
                                                                        "Current in phase B: " +
                                                                        _modelInstance
                                                                            .currentB! +
                                                                        "\n" +
                                                                        "Current in phase C: " +
                                                                        _modelInstance
                                                                            .currentC! +
                                                                        "\n" +
                                                                        "RPM: " +
                                                                        _modelInstance
                                                                            .rpm! +
                                                                        "\n" +
                                                                        "Ambient temp: " +
                                                                        _modelInstance
                                                                            .ambientTemp! +
                                                                        "\n" +
                                                                        "NDE temp: " +
                                                                        _modelInstance
                                                                            .tempNDE! +
                                                                        "\n" +
                                                                        "DE temp: " +
                                                                        _modelInstance
                                                                            .tempDE! +
                                                                        "\n" +
                                                                        "Frame temp: " +
                                                                        _modelInstance
                                                                            .tempFrame! +
                                                                        "\n" +
                                                                        "Yellow phase temp: " +
                                                                        _modelInstance
                                                                            .yellowPT! +
                                                                        "\n" +
                                                                        "Green phase temp: " +
                                                                        _modelInstance
                                                                            .greenPT! +
                                                                        "\n" +
                                                                        "Red phase temp: " +
                                                                        _modelInstance
                                                                            .redPT! +
                                                                        "\n");
                                                                    }
                                                                    else{
                                                                      _modelInstance.measurments.add("Time: " +
                                                                        _modelInstance
                                                                            .time! +
                                                                        "\n" +
                                                                        "Current in phase A: " +
                                                                        _modelInstance
                                                                            .currentA! +
                                                                        "\n" +
                                                                        "Current in phase B: " +
                                                                        _modelInstance
                                                                            .currentB! +
                                                                        "\n" +
                                                                        "Current in phase C: " +
                                                                        _modelInstance
                                                                            .currentC! +
                                                                        "\n" +
                                                                        "RPM: " +
                                                                        _modelInstance
                                                                            .rpm! +
                                                                        "\n" +
                                                                        "Ambient temp: " +
                                                                        _modelInstance
                                                                            .ambientTemp! +
                                                                        "\n" +
                                                                        "NDE temp: " +
                                                                        _modelInstance
                                                                            .tempNDE! +
                                                                        "\n" +
                                                                        "DE temp: " +
                                                                        _modelInstance
                                                                            .tempDE! +
                                                                        "\n" +
                                                                        "Frame temp: " +
                                                                        _modelInstance
                                                                            .tempFrame! +
                                                                        "\n");
                                                                    }
                                                                    _modelInstance
                                                                        .measurments
                                                                        .sort();
                                                                  });
                                                                  Navigator.pop(
                                                                    context,
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          )))
                                                    ],
                                                  )),
                                            );
                                          });
                                    },
                                  ),  
                                ))),
                          
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
                                    if (_formKeyForms.currentState!
                                        .validate()) {
                                      _formKeyForms.currentState!.save();
                                      _modelInstance.sendData();
                                      bar.show(context);
                                      Navigator.pop(
                                        context,
                                      );
                                    }
                                  },
                                ),
                              ))),
                        ]));
                }))));
  }
}


Future<Map<String, dynamic>?> getMap(String docName, String collection) async {
  Map<String, dynamic>? dataMap;
  CollectionReference reference = Firestore.instance.collection(collection);
  DocumentReference dataRef = reference.document(docName);
  if (await dataRef.exists) {
    Document document = await dataRef.get();
    return document.map;
  }
  return dataMap;
}

Future<bool> isMotorHighVoltage(String docName) async {
  final dataMap = await getMap(docName, "Initial form");
  if (dataMap!["electricalMeasurement"]["highVoltage"]) {
    return true;
  } else {
    return false;
  }
}
