// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:unit_converter/api.dart';
import 'package:unit_converter/category.dart';
import 'package:unit_converter/unit.dart';

const _padding = EdgeInsets.all(5.0);

/// [UnitConverter] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
class UnitConverter extends StatefulWidget {
  /// The current [Category] for unit conversion.
  final Category category;

  /// This [UnitConverter] takes in a [Category] with [Units]. It can't be null.
  const UnitConverter({
    @required this.category,
  }) : assert(category != null);

  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  Unit _fromValue;
  Unit _toValue;
  double _inputValue;
  String _convertedValue = '';
  List<DropdownMenuItem> _unitMenuItems;
  bool _showValidationError = false;
  final _inputKey = GlobalKey(debugLabel: 'inputText');
  bool _showErrorUI = false;
  final _firstName = GlobalKey(debugLabel: 'First Name');
  final _lastName = GlobalKey(debugLabel: 'Last Name');
  final _email1 = GlobalKey(debugLabel: 'Email1');
  final _email2 = GlobalKey(debugLabel: 'Email2');
  final _sex = GlobalKey(debugLabel: 'Sex');
  final _country = GlobalKey(debugLabel: 'Country');
  final _phone1 = GlobalKey(debugLabel: 'Phone1');
  final _phone2 = GlobalKey(debugLabel: 'Phone2');
  final _passportNo = GlobalKey(debugLabel: 'Passport No');
  final _bankAcctNo = GlobalKey(debugLabel: 'Banc Acct No');
  final _bankName = GlobalKey(debugLabel: 'Bank Name');
  final _insurance = GlobalKey(debugLabel: 'Insurance');
  final _insuranceNo = GlobalKey(debugLabel: 'Insurance No');
  final _insuranceCpy = GlobalKey(debugLabel: 'Insurance Copy');
  final _tin = GlobalKey(debugLabel: 'TIN');
  final _cvStatusElec = GlobalKey(debugLabel: 'CV Status Electronic');
  final _fab1 = GlobalKey(debugLabel: 'Add User');
  final _fab2 = GlobalKey(debugLabel: 'Add Role');
  final _fab3 = GlobalKey(debugLabel: 'Add Project');
  final _fab4 = GlobalKey(debugLabel: 'Add Tag');
  final _fab5 = GlobalKey(debugLabel: 'Add Device');

  @override
  void initState() {
    super.initState();
    _createDropdownMenuItems();
    _setDefaults();
  }

  @override
  void didUpdateWidget(UnitConverter old) {
    super.didUpdateWidget(old);
    // We update our [DropdownMenuItem] units when we switch [Categories].
    if (old.category != widget.category) {
      _createDropdownMenuItems();
      _setDefaults();
    }
  }

  /// Creates fresh list of [DropdownMenuItem] widgets, given a list of [Unit]s.
  void _createDropdownMenuItems() {
    var newItems = <DropdownMenuItem>[];
    for (var unit in widget.category.units) {
      newItems.add(DropdownMenuItem(
        value: unit.name,
        child: Container(
          child: Text(
            unit.name,
            softWrap: true,
          ),
        ),
      ));
    }
    setState(() {
      _unitMenuItems = newItems;
    });
  }

  /// Sets the default values for the 'from' and 'to' [Dropdown]s, and the
  /// updated output value if a user had previously entered an input.
  void _setDefaults() {
    setState(() {
      _fromValue = widget.category.units[0];
      _toValue = widget.category.units[1];
    });
    if (_inputValue != null) {
      _updateConversion();
    }
  }

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  Future<void> _updateConversion() async {
  // Our API has a handy convert function, so we can use that for
  // the Currency [Category]
  if (widget.category.name == apiCategory['name']) {
  final api = Api();
  final conversion = await api.convert(apiCategory['route'],
  _inputValue.toString(), _fromValue.name, _toValue.name);
  // API error or not connected to the internet
  if (conversion == null) {
  setState(() {
  _showErrorUI = true;
  });
  } else {
  setState(() {
  _convertedValue = _format(conversion);
  });
  }
  } else {
  // For the static units, we do the conversion ourselves
  setState(() {
  _convertedValue = _format(
  _inputValue * (_toValue.conversion / _fromValue.conversion));
  });
  }
  }

  void _updateInputValue(String input) {
  setState(() {
  if (input == null || input.isEmpty) {
  _convertedValue = '';
  } else {
  // Even though we are using the numerical keyboard, we still have to check
  // for non-numerical input such as '5..0' or '6 -3'
  try {
  final inputDouble = double.parse(input);
  _showValidationError = false;
  _inputValue = inputDouble;
  _updateConversion();
  } on Exception catch (e) {
  print('Error: $e');
  _showValidationError = true;
  }
  }
  });
  }

  Unit _getUnit(String unitName) {
  return widget.category.units.firstWhere(
  (Unit unit) {
  return unit.name == unitName;
  },
  orElse: null,
  );
  }

  void _updateFromConversion(dynamic unitName) {
  setState(() {
  _fromValue = _getUnit(unitName);
  });
  if (_inputValue != null) {
  _updateConversion();
  }
  }

  void _updateToConversion(dynamic unitName) {
  setState(() {
  _toValue = _getUnit(unitName);
  });
  if (_inputValue != null) {
  _updateConversion();
  }
  }

  Widget _createDropdown(String currentValue, ValueChanged<dynamic> onChanged) {
  return Container(
  margin: EdgeInsets.only(top: 16.0),
  decoration: BoxDecoration(
  // This sets the color of the [DropdownButton] itself
  color: Colors.grey[50],
  border: Border.all(
  color: Colors.grey[400],
  width: 1.0,
  ),
  ),
  padding: EdgeInsets.symmetric(vertical: 8.0),
  child: Theme(
  // This sets the color of the [DropdownMenuItem]
  data: Theme.of(context).copyWith(
  canvasColor: Colors.grey[50],
  ),
  child: DropdownButtonHideUnderline(
  child: ButtonTheme(
  alignedDropdown: true,
  child: DropdownButton(
  value: currentValue,
  items: _unitMenuItems,
  onChanged: onChanged,
  style: Theme.of(context).textTheme.title,
  ),
  ),
  ),
  ),
  );
  }

  @override
  Widget build(BuildContext context) {
  if (widget.category.units == null ||
  (widget.category.name == apiCategory['name'] && _showErrorUI)) {
  return SingleChildScrollView(
  child: Container(
  margin: _padding,
  padding: _padding,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(16.0),
  color: widget.category.color['error'],
  ),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Icon(
  Icons.error_outline,
  size: 180.0,
  color: Colors.white,
  ),
  Text(
  "Oh no! We can't connect right now!",
  textAlign: TextAlign.center,
  style: Theme.of(context).textTheme.headline.copyWith(
  color: Colors.white,
  ),
  ),
  ],
  ),
  ),
  );
  }
  final padding = new Padding(padding: _padding);
  final input = Padding(
  padding: _padding,
  child: Column(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

  // This is the widget that accepts text input. In this case, it
  // accepts numbers and calls the onChanged property on update.
  // You can read more about it here: https://flutter.io/text-input
  ListTile(
  leading: const Icon(Icons.person),
  title: TextField(
  key: _firstName,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  contentPadding: const EdgeInsets.all(20.0),
  errorText:
  _showValidationError ? 'Invalid Name entered' : null,
  labelText: 'First Name',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.text,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  ListTile(
  leading: const Icon(Icons.person),
  title: TextField(
  key: _lastName,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Last Name',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.text,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.email),
  title: TextField(
  key: _email1,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Email',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.emailAddress,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.email),
  title: TextField(
  key: _email2,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Other Email',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.emailAddress,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.phone),
  title: TextField(
  key: _phone1,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Phone',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.phone,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.phone),
  title: TextField(
  key: _phone2,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Other Phone',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.phone,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.perm_identity),
  title: TextField(
  key: _passportNo,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Passport No',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.text,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.home),
  title: TextField(
  key: _bankName,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Bank Name',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.text,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.home),
  title: TextField(
  key: _bankAcctNo,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Bank Account Number',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.number,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.airline_seat_legroom_extra),
  title: TextField(
  key: _insurance,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Insurance',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.text,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.airline_seat_legroom_extra),
  title: TextField(
  key: _insuranceCpy,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Insurance Copy',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.text,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.airline_seat_legroom_extra),
  title: TextField(
  key: _insuranceNo,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'Insurance No',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.phone,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.perm_identity),
  title: TextField(
  key: _tin,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'TIN',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.number,
  onChanged: _updateInputValue,
  ),
  ),
  padding,
  new ListTile(
  leading: const Icon(Icons.perm_identity),
  title: TextField(
  key: _cvStatusElec,
  style: Theme.of(context).textTheme.button,
  decoration: InputDecoration(
  labelStyle: Theme.of(context).textTheme.button,
  errorText:
  _showValidationError ? 'Invalid number entered' : null,
  labelText: 'CV Status Electronic',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  ),
  ),
  // Since we only want numerical input, we use a number keyboard. There
  // are also other keyboards for dates, emails, phone numbers, etc.
  keyboardType: TextInputType.text,
  onChanged: _updateInputValue,
  ),
  ),
  ],
  ),
  );

  final arrows = RotatedBox(
  quarterTurns: 1,
  child: Icon(
  Icons.compare_arrows,
  size: 40.0,
  ),
  );

  final save = RaisedButton(
  onPressed: () {},
  child: new Text('Save'),
  );
  final changePasswd = RaisedButton(
  onPressed: () {},
  child: new Text('Change Password'),
  );

  final output = Padding(
  padding: _padding,
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
  InputDecorator(
  child: Text(
  _convertedValue,
  style: Theme.of(context).textTheme.display1,
  ),
  decoration: InputDecoration(
  labelText: 'Output',
  labelStyle: Theme.of(context).textTheme.display1,
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(0.0),
  ),
  ),
  ),
  _createDropdown(_toValue.name, _updateToConversion),
  ],
  ),
  );

 final fab1 =  new FloatingActionButton(
  key: _fab1,
  elevation: 20.0,
  child: new Icon(Icons.person_add),
  tooltip: "Add User",
  backgroundColor: new Color(0xFFE57373),
  onPressed: (){}
  );
  final fab2 =  new FloatingActionButton(
  key: _fab2,
  tooltip: "Add Role",
  elevation: 20.0,
  child: new Icon(Icons.library_add),
  backgroundColor: new Color(0xFFE57373),
  onPressed: (){}
  );
  final fab3 =  new FloatingActionButton(
  key: _fab3,
  tooltip: "Add Project",
  elevation: 20.0,
  child: new Icon(Icons.add_box),
  backgroundColor: new Color(0xFFE57373),
  onPressed: (){}
  );
  final fab4 =  new FloatingActionButton(
  key: _fab4,
  tooltip: "Add Tag",
  elevation: 20.0,
  child: new Icon(Icons.title),
  backgroundColor: new Color(0xFFE57373),
  onPressed: (){}
  );
  final fab5 =  new FloatingActionButton(
  key: _fab5,
  tooltip: "Add Device",
  elevation: 20.0,
  child: new Icon(Icons.devices),
  backgroundColor: new Color(0xFFE57373),
  onPressed: (){}
  );


  final converter = ListView(
  children: [
  new Row(
  textDirection: TextDirection.rtl,
  textBaseline: TextBaseline.alphabetic,
  children: <Widget>[
  fab1,
  padding,
  fab2,
  padding,
  fab3,
  padding,
  fab4,
  padding,
  fab5
  ],
  ),
  input,
  padding,
  save,
  padding,
  changePasswd,
  ],
  );

  // Based on the orientation of the parent widget, figure out how to best
  // lay out our converter.
  return Padding(
  padding: _padding,
  child: OrientationBuilder(
  builder: (BuildContext context, Orientation orientation) {
  if (orientation == Orientation.portrait) {
  return converter;
  } else {
  return Center(
  child: Container(
  width: 450.0,
  child: converter,
  ),
  );
  }
  },
  ),
  );
  }
}
