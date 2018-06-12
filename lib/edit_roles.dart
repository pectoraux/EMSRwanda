
import 'dart:async';

import 'package:flutter/material.dart';

import 'supplemental/cut_corners_border.dart';
import 'constants.dart';




class EditRolePage extends StatefulWidget {
  @override
  EditRolePageState createState() => EditRolePageState();
}

class EditRolePageState extends State<EditRolePage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _inputKey = GlobalKey(debugLabel: 'inputText');
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
  final _padding = EdgeInsets.all(5.0);

  @override
  Widget build(BuildContext context) {

    final padding = Padding(padding: _padding);


    final converter =  ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            PrimaryColorOverride(
              color: TodoColors.accent,
              child: TextField(
                key: _firstName,
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: CutCornersBorder(),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            new PrimaryColorOverride(
              color: TodoColors.accent,
              child: TextField(
                key: _lastName,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: CutCornersBorder(),
                ),
              ),
            ),
            const SizedBox(height: 12.0),

            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('SAVE'),
                  elevation: 8.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ],
        );

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

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}
