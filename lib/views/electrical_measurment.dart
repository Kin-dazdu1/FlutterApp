import 'package:flutter/material.dart';
import 'package:work_shop_app/models/electrical_measurement_model.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:snack/snack.dart';

class ElectricalMeasurment extends StatefulWidget {
  final String docName;
  @override
  _ElectricalMeasurment createState() => _ElectricalMeasurment();
  const ElectricalMeasurment({Key? key, required this.docName})
      : super(key: key);
}

class _ElectricalMeasurment extends State<ElectricalMeasurment> {
  late final ElectricalMeasurmentModel _modelInstance =
      ElectricalMeasurmentModel(docName: widget.docName);
  final _formKeyAlertForms = GlobalKey<FormState>();
  final _formKeyForms = GlobalKey<FormState>();
  final bar = SnackBar(
      content: Text(Localozation.localization
          ? "Data succesfully added"
          : "Данные успешно добавленны"));
  RegExp commonregex = RegExp(
      r"((\d+ ?MOhm)|(\d+\.\d+ ?MOhm)|(\d+ ?GOhm)|(\d+\.\d+ ?GOhm))|(N/A)|(< ?\d+ ?kOhm)");
  RegExp regexWindingRes =
      RegExp(r"(\d+\.\d+ ? Ohm)|(\d+\.\d+ ? mOhm)|(\d+ ? Ohm)|(\d+ ? mOhm)");
  RegExp regexTestVoltage =
      RegExp(r"(\d+\.\d+ ?V)|(\d+\.\d+ ?kV)|(\d+ ?V)|(\d+ ?kV)");
  RegExp termoResRes =
      RegExp(r"(\d+ Ohm)|(\d+ kOhm)|(\d+\.\d+ Ohm)|(\d+\.\d+ kOhm)");
  bool switchWinding = false;
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
                child: Builder(
                    builder: (context) => Form(
                        key: _formKeyForms,
                        child: ListView(cacheExtent: 20000000, children: [
                          
                          Center(
                              child: Text(
                                  Localozation.localization
                                      ? "Electrical measurement of entry card"
                                      : "Электрические испытания карты входного контроля",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))),
                          SwitchListTile(
                              title: Text(
                                  Localozation.localization
                                      ? "High voltage motor"
                                      : "Высоковольный мотор",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              value: _modelInstance.highVoltage,
                              onChanged: (bool value) => setState(
                                  () => _modelInstance.highVoltage = value)),
                          
                          CommonForm(
                            keyBoardType: TextInputType.number,
                            labelText: Localozation.localization
                                ? "Winding t˚"
                                : "Температура обмотки t˚",
                            emptyValue: Localozation.localization
                                ? "Enter winding t˚"
                                : "Введите температуру обмотки t˚",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(
                                () => _modelInstance.windingTemp = value),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Test voltage"
                                : "Напряжение испытания",
                            emptyValue: Localozation.localization
                                ? "Enter test voltage in valid format"
                                : "Введите напряжение испытания",
                            regEx: regexTestVoltage,
                            regExFormat: Localozation.localization
                                ? "Valid format: 1kV or 1000 V"
                                : "Принимаемый формат: 1kV или 1000 V",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.testVoltage =
                                    regexTestVoltage.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of insulation between phases U-V"
                                : "Сопротивление изоляции между фазами U-V",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление изоляции между фазами U-V",
                            regEx: commonregex,
                            regExFormat: Localozation.localization
                                ? "valid format: 100MOhm or 100 GOhm"
                                : "Принимаемый формат: 100 MOhm или 100 GOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceUV =
                                    commonregex.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of insulation between phases V-W"
                                : "Сопротивление изоляции между фазами V-W",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление изоляции между фазами V-W",
                            regEx: commonregex,
                            regExFormat: Localozation.localization
                                ? "valid format: 100MOhm or 100 GOhm"
                                : "Принимаемый формат: 100 MOhm или 100 GOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceVW =
                                    commonregex.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of insulation between phases U-W"
                                : "Сопротивление изоляции между фазами U-W",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление изоляции между фазами U-W",
                            regEx: commonregex,
                            regExFormat: Localozation.localization
                                ? "valid format: 100MOhm or 100 GOhm"
                                : "Принимаемый формат: 100 MOhm или 100 GOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceWU =
                                    commonregex.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of insulation between phases U-E"
                                : "Сопротивление изоляции между фазой U и землей",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление изоляции между фазой U и землей",
                            regEx: commonregex,
                            regExFormat: Localozation.localization
                                ? "valid format: 100MOhm or 100 GOhm"
                                : "Принимаемый формат: 100 MOhm или 100 GOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceUE =
                                    commonregex.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of insulation between phases V-E"
                                : "Сопротивление изоляции между фазой V и землей",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление изоляции между фазой V и землей",
                            regEx: commonregex,
                            regExFormat: Localozation.localization
                                ? "valid format: 100MOhm or 100 GOhm"
                                : "Принимаемый формат: 100 MOhm или 100 GOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceVE =
                                    commonregex.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of insulation between phases W-E"
                                : "Сопротивление изоляции между фазой W и землей",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление изоляции между фазой W и землей",
                            regEx: commonregex,
                            regExFormat: Localozation.localization
                                ? "valid format: 100MOhm or 100 GOhm"
                                : "Принимаемый формат: 100 MOhm или 100 GOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceWE =
                                    commonregex.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of each phase U1-U2"
                                : "Сопротивление каждой фазы U1-U2",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление каждой фазы U1-U2",
                            regEx: regexWindingRes,
                            regExFormat: Localozation.localization
                                ? "valid format: 100Ohm or 100 mOhm"
                                : "Принимаемый формат: 100Ohm или 100 mOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceUU =
                                    regexWindingRes.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of each phase V1-V2"
                                : "Сопротивление каждой фазы V1-V2",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление каждой фазы U1-U2",
                            regEx: regexWindingRes,
                            regExFormat: Localozation.localization
                                ? "valid format: 100Ohm or 100 mOhm"
                                : "Принимаемый формат: 100Ohm или 100 mOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceVV =
                                    regexWindingRes.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Resistence of each phase W1-W2"
                                : "Сопротивление каждой фазы W1-W2",
                            emptyValue: Localozation.localization
                                ? "Enter resistence of insulation in valid format"
                                : "Введите сопротивление каждой фазы W1-W2",
                            regEx: regexWindingRes,
                            regExFormat: Localozation.localization
                                ? "valid format: 100Ohm or 100 mOhm"
                                : "Принимаемый формат: 100Ohm или 100 mOhm",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(() =>
                                _modelInstance.resistenceWW =
                                    regexWindingRes.stringMatch(value!)),
                          ),
                          
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization
                                ? "Common insulation resistence of winding"
                                : "Общее сопротивление обмокти двигателя",
                            emptyValue: Localozation.localization
                                ? "Enter common insulation resistence of winding in valid format"
                                : "Введите общее сопротивление обмокти двигателя",
                            regEx: commonregex,
                            regExFormat: Localozation.localization
                                ? "valid format: 100OMhm or 100 GOhm"
                                : "Принимаемый формат: 100OMhm или 100 GOhm",
                            textInputAction: TextInputAction.done,
                            onSaved: (value) => setState(() =>
                                _modelInstance.commonResistence =
                                    commonregex.stringMatch(value!)),
                          ),
                          
                          if (_modelInstance.highVoltage == true)
                            CommonForm(
                              keyBoardType: TextInputType.text,
                              labelText: Localozation.localization
                                  ? "Insulation resistance after 15 seconds"
                                  : "Сопротивление изоляции обмокти после 15 секунд",
                              emptyValue: Localozation.localization
                                  ? "Enter insulation resistance after 15 seconds in valid format"
                                  : "Введите сопротивление изоляции обмокти после 15 секунд",
                              regEx: commonregex,
                              regExFormat: Localozation.localization
                                  ? "valid format: 100OMhm or 100 GOhm"
                                  : "Принимаемый формат: 100OMhm или 100 GOhm",
                              textInputAction: TextInputAction.done,
                              onSaved: (value) => setState(() =>
                                  _modelInstance.resistence15 =
                                      commonregex.stringMatch(value!)!),
                            ),
                          
                          if (_modelInstance.highVoltage == true)
                            CommonForm(
                              keyBoardType: TextInputType.text,
                              labelText: Localozation.localization
                                  ? "Insulation resistance after 60 seconds"
                                  : "Сопротивление изоляции обмокти после 60 секунд",
                              emptyValue: Localozation.localization
                                  ? "Enter insulation resistance after 60 seconds in valid format"
                                  : "Введите сопротивление изоляции обмокти после 60 секунд",
                              regEx: commonregex,
                              regExFormat: Localozation.localization
                                  ? "valid format: 100OMhm or 100 GOhm"
                                  : "Принимаемый формат: 100OMhm или 100 GOhm",
                              textInputAction: TextInputAction.done,
                              onSaved: (value) => setState(() =>
                                  _modelInstance.resistence60 =
                                      commonregex.stringMatch(value!)!),
                            ),
                          
                          if (_modelInstance.highVoltage == true)
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
                          
                          SwitchListTile(
                              title: Text(
                                  Localozation.localization
                                      ? "Motor needs rewinding"
                                      : "Мотору нужна перемотка",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              value: _modelInstance.switchWinding,
                              onChanged: (bool value) => setState(
                                  () => _modelInstance.switchWinding = value)),
                          
                          ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _modelInstance.ptc.length,
                            itemBuilder: (buildContext, int index) {
                              return Dismissible(
                                  direction: DismissDirection.none,
                                  key: Key(_modelInstance.ptc[index]),
                                  child: Card(
                                      margin: const EdgeInsets.all(8),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: ListTile(
                                          title:
                                              Text(_modelInstance.ptc[index]),
                                          trailing: IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _modelInstance.ptc
                                                      .removeAt(index);
                                                });
                                              }))));
                            },
                          ),
                          
                          ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _modelInstance.rtd.length,
                            itemBuilder: (buildContext, int index) {
                              return Dismissible(
                                  direction: DismissDirection.none,
                                  key: Key(_modelInstance.rtd[index]),
                                  child: Card(
                                      margin: const EdgeInsets.all(8),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: ListTile(
                                          title:
                                              Text(_modelInstance.rtd[index]),
                                          trailing: IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _modelInstance.rtd
                                                      .removeAt(index);
                                                });
                                              }))));
                            },
                          ),
                          
                          ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _modelInstance.heaters.length,
                            itemBuilder: (buildContext, int index) {
                              return Dismissible(
                                  direction: DismissDirection.none,
                                  key: Key(_modelInstance.heaters[index]),
                                  child: Card(
                                      margin: const EdgeInsets.all(8),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: ListTile(
                                          title: Text(
                                              _modelInstance.heaters[index]),
                                          trailing: IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _modelInstance.heaters
                                                      .removeAt(index);
                                                });
                                              }))));
                            },
                          ),
                          
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 20.0,
                                    ),
                                    child: Center(
                                        child: SizedBox(
                                      child: ElevatedButton(
                                        child: Text(Localozation.localization
                                            ? "Add PTC"
                                            : "Добавить PTC"),
                                        style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder()),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                    child: Form(
                                                        key: _formKeyAlertForms,
                                                        child:
                                                            ListView(children: [
                                                          SizedBox(
                                                            height: 50,
                                                            child: Center(
                                                                child: Text(
                                                                    Localozation.localization
                                                                        ? "Enter measurements"
                                                                        : "Введите измерения",
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight.bold))),
                                                          ),
                                                          CommonForm(
                                                            keyBoardType:
                                                                TextInputType
                                                                    .text,
                                                            labelText: Localozation
                                                                    .localization
                                                                ? "PTC name"
                                                                : "Название PTC",
                                                            emptyValue: Localozation
                                                                    .localization
                                                                ? "Valid format: PTC1"
                                                                : "Принимаемый формат PTC1",
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            onSaved: (value) => setState(
                                                                () => _modelInstance
                                                                    .ptcName = RegExp(
                                                                        r"PTC\d{1}")
                                                                    .stringMatch(
                                                                        value!)),
                                                            regEx: RegExp(
                                                                r"PTC\d{1}"),
                                                            regExFormat: Localozation
                                                                    .localization
                                                                ? "Valid format: PTC1"
                                                                : "Принимаемый формат PTC1",
                                                          ),
                                                          CommonForm(
                                                            keyBoardType:
                                                                TextInputType
                                                                    .text,
                                                            labelText: Localozation
                                                                    .localization
                                                                ? "PTC resistance"
                                                                : "Сопротивление PTC",
                                                            emptyValue: Localozation
                                                                    .localization
                                                                ? "Valid format: 125 Ohm or kOhm"
                                                                : "Принимаемый формат: 125 Ohm или kOhm",
                                                            textInputAction:
                                                                TextInputAction
                                                                    .done,
                                                            onSaved: (value) => setState(
                                                                () => _modelInstance
                                                                        .ptcResistance =
                                                                    termoResRes
                                                                        .stringMatch(
                                                                            value!)),
                                                            regEx: termoResRes,
                                                            regExFormat: Localozation
                                                                    .localization
                                                                ? "Valid format: 125 Ohm or kOhm"
                                                                : "Принимаемый формат: 125 Ohm или kOhm",
                                                          ),
                                                          Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                vertical: 20.0,
                                                                horizontal:
                                                                    20.0,
                                                              ),
                                                              child: Center(
                                                                child:
                                                                    ElevatedButton(
                                                                  child: Text(Localozation
                                                                          .localization
                                                                      ? "Add"
                                                                      : "Добавить"),
                                                                  onPressed:
                                                                      () {
                                                                    if (_formKeyAlertForms
                                                                        .currentState!
                                                                        .validate()) {
                                                                      _formKeyAlertForms
                                                                          .currentState!
                                                                          .save();
                                                                      setState(
                                                                          () {
                                                                        _modelInstance.ptc.add(_modelInstance.ptcName! +
                                                                            " = " +
                                                                            _modelInstance.ptcResistance!);
                                                                        _modelInstance
                                                                            .ptc
                                                                            .sort();
                                                                      });
                                                                      Navigator
                                                                          .pop(
                                                                        context,
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ))
                                                        ])));
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
                                            ? "Add RTD"
                                            : "Добавить RTD"),
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
                                                                              FontWeight.bold))),
                                                            ),
                                                            CommonForm(
                                                              keyBoardType:
                                                                  TextInputType
                                                                      .text,
                                                              labelText: Localozation
                                                                      .localization
                                                                  ? "RTD name"
                                                                  : "Название RTD",
                                                              emptyValue: Localozation
                                                                      .localization
                                                                  ? "Valid format: RTD1"
                                                                  : "Принимаемый формат RTD1",
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              onSaved: (value) => setState(() =>
                                                                  _modelInstance
                                                                      .rtdName = RegExp(
                                                                          r"RTD\d{1}")
                                                                      .stringMatch(
                                                                          value!)),
                                                              regEx: RegExp(
                                                                  r"RTD\d{1}"),
                                                              regExFormat: Localozation
                                                                      .localization
                                                                  ? "Valid format: RTD1"
                                                                  : "Принимаемый формат RTD1",
                                                            ),
                                                            CommonForm(
                                                              keyBoardType:
                                                                  TextInputType
                                                                      .text,
                                                              labelText: Localozation
                                                                      .localization
                                                                  ? "RTD resistance"
                                                                  : "Сопротивление RTD",
                                                              emptyValue: Localozation
                                                                      .localization
                                                                  ? "Valid format: 125 Ohm or kOhm"
                                                                  : "Принимаемый формат: 125 Ohm или kOhm",
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .done,
                                                              onSaved: (value) => setState(() =>
                                                                  _modelInstance
                                                                          .rtdResistance =
                                                                      termoResRes
                                                                          .stringMatch(
                                                                              value!)),
                                                              regEx:
                                                                  termoResRes,
                                                              regExFormat:
                                                                  "125 Ohm, 0.125 kOhm",
                                                            ),
                                                            Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical:
                                                                      20.0,
                                                                  horizontal:
                                                                      20.0,
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      ElevatedButton(
                                                                    child: Text(Localozation
                                                                            .localization
                                                                        ? "Add"
                                                                        : "Добавить"),
                                                                    onPressed:
                                                                        () {
                                                                      if (_formKeyAlertForms
                                                                          .currentState!
                                                                          .validate()) {
                                                                        _formKeyAlertForms
                                                                            .currentState!
                                                                            .save();
                                                                        setState(
                                                                            () {
                                                                          _modelInstance.rtd.add(_modelInstance.rtdName! +
                                                                              " = " +
                                                                              _modelInstance.rtdResistance!);
                                                                          _modelInstance
                                                                              .rtd
                                                                              .sort();
                                                                        });
                                                                        Navigator
                                                                            .pop(
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
                                                                              FontWeight.bold))),
                                                            ),
                                                            CommonForm(
                                                              keyBoardType:
                                                                  TextInputType
                                                                      .text,
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
                                                              onSaved: (value) => setState(() =>
                                                                  _modelInstance
                                                                      .heName = RegExp(
                                                                          r"HE\d{1}")
                                                                      .stringMatch(
                                                                          value!)),
                                                              regEx: RegExp(
                                                                  r"HE\d{1}"),
                                                              regExFormat: Localozation
                                                                      .localization
                                                                  ? "Valid format: HE1"
                                                                  : "Принимаемый формат: HE1",
                                                            ),
                                                            CommonForm(
                                                              keyBoardType:
                                                                  TextInputType
                                                                      .text,
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
                                                              onSaved: (value) => setState(() =>
                                                                  _modelInstance
                                                                          .heResistance =
                                                                      termoResRes
                                                                          .stringMatch(
                                                                              value!)),
                                                              regEx:
                                                                  termoResRes,
                                                              regExFormat: Localozation
                                                                      .localization
                                                                  ? "Valid format: 125 Ohm or kOhm"
                                                                  : "Принимаемый формат: 125 Ohm или kOhm",
                                                            ),
                                                            CommonForm(
                                                              keyBoardType:
                                                                  TextInputType
                                                                      .text,
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
                                                              onSaved: (value) => setState(() =>
                                                                  _modelInstance
                                                                          .heInsulationResistanceWinding =
                                                                      commonregex
                                                                          .stringMatch(
                                                                              value!)),
                                                              regEx:
                                                                  commonregex,
                                                              regExFormat:
                                                                  "125 GOhm, 0.125 MOhm",
                                                            ),
                                                            CommonForm(
                                                              keyBoardType:
                                                                  TextInputType
                                                                      .text,
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
                                                              onSaved: (value) => setState(() =>
                                                                  _modelInstance
                                                                          .heInsulationResistanceEarth =
                                                                      commonregex
                                                                          .stringMatch(
                                                                              value!)),
                                                              regEx:
                                                                  commonregex,
                                                              regExFormat:
                                                                  "125 GOhm, 0.125 MOhm",
                                                            ),
                                                            Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical:
                                                                      20.0,
                                                                  horizontal:
                                                                      20.0,
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      ElevatedButton(
                                                                    child: Text(Localozation
                                                                            .localization
                                                                        ? "Add"
                                                                        : "Добавить"),
                                                                    onPressed:
                                                                        () {
                                                                      if (_formKeyAlertForms
                                                                          .currentState!
                                                                          .validate()) {
                                                                        _formKeyAlertForms
                                                                            .currentState!
                                                                            .save();
                                                                        setState(
                                                                            () {
                                                                          _modelInstance.heaters.add(_modelInstance.heName! +
                                                                              " = " +
                                                                              _modelInstance.heResistance! +
                                                                              "\n" +
                                                                              _modelInstance.heName! +
                                                                              "winding = " +
                                                                              _modelInstance.heInsulationResistanceWinding! +
                                                                              "\n" +
                                                                              _modelInstance.heName! +
                                                                              "earth = " +
                                                                              _modelInstance.heInsulationResistanceEarth!);
                                                                          _modelInstance
                                                                              .heaters
                                                                              .sort();
                                                                        });
                                                                        Navigator
                                                                            .pop(
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
                                    )))
                              ]),
                          
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 20.0,
                            ),
                            child: ElevatedButton(
                              child: Text(Localozation.localization
                                  ? "Save"
                                  : "Сохранить"),
                              onPressed: () {
                                if (_formKeyForms.currentState!.validate()) {
                                  _formKeyForms.currentState!.save();
                                  _modelInstance.sendData();
                                  bar.show(context);
                                  Navigator.pop(
                                    context,
                                  );
                                }
                              },
                            ),
                          ),
                        ]))))));
  }
}
