import 'supplemental/cut_corners_border.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'constants.dart';
import 'profile_fonts.dart';
import 'view_projects.dart';

/// QuickActions represents the horizontal list of rectangular buttons below the header
class QuickProjectActions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final blueGradient = const LinearGradient(
        colors: const <Color>[
          const Color(0xFF0075D1),
          const Color(0xFF00A2E3),
        ],
        stops: const <double>[0.4, 0.6],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft);
    final purpleGraient = const LinearGradient(
        colors: const <Color>[
          const Color(0xFF882DEB),
          const Color(0xFF9A4DFF)
        ],
        stops: const <double>[0.5, 0.7],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight);
    final redGradient = const LinearGradient(
        colors: const <Color>[
          const Color(0xFFBA110E),
          const Color(0xFFCF3110),
        ],
        stops: const <double>[0.6, 0.8],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft);

    return new Container(
      constraints: const BoxConstraints(maxHeight: 120.0),
      margin: const EdgeInsets.only(top: 20.0),
      child: new Align(
        alignment: Alignment.center,
        child: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
                left: 10.0, bottom: 20.0, right: 10.0, top: 10.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildAction(context,
                  "View\nProjects", () {}, Colors.blue, blueGradient,
                  new AssetImage("assets/images/microphone.png")),
              _buildAction(context,
                  "Delete\nProject", () {}, Colors.purple, purpleGraient,
                  new AssetImage("assets/images/wallet.png")),
            ]
        ),
      ),
    );
  }

  Widget _buildAction(BuildContext context, String title, VoidCallback action,
      Color color,
      Gradient gradient, ImageProvider backgroundImage) {
    final textStyle = new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 18.0,
        fontFamily: ProfileFontNames.TimeBurner);

    return new GestureDetector(
      onTap: action,
      child: new Container(
        margin: const EdgeInsets.only(right: 5.0, left: 5.0),
        width: 150.0,
        decoration: new BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(color: Colors.black38,
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  offset: new Offset(0.0, 1.0)),
            ],
            gradient: gradient
        ),
        child: new Stack(
          children: <Widget>[
            new Opacity(
              opacity: 0.2,
              child: new Align(
                alignment: Alignment.centerRight,
                child: new Transform.rotate(
                  angle: -PI / 4.8,
                  alignment: Alignment.centerRight,
                  child: new ClipPath(
                    clipper: new _BackgroundImageClipper(),
                    child: new Container(
                      padding: const EdgeInsets.only(
                          bottom: 20.0, right: 0.0, left: 60.0),
                      child: new Image(
                        width: 90.0,
                        height: 90.0,
                        image: backgroundImage != null
                            ? backgroundImage
                            : new AssetImage("assets/images/microphone.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ), // END BACKGROUND IMAGE

            new Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: InkWell
                  (
                  // Do onTap() if it isn't null, otherwise do print()
                  onTap: onTap != null ? () => onTap(context, title) : () {
                    print('Not set yet');
                  },
                  child: new Text(title, style: textStyle),
                )
            ),
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext context, String title) {
    final _padding = EdgeInsets.all(5.0);
    final _projectTitleController = TextEditingController();
    final _projectTitle = GlobalKey(debugLabel: 'Project Title');
    final _projectLocationsController = TextEditingController();
    final _projectTagsController = TextEditingController();
    final _projectLocations = GlobalKey(debugLabel: 'Project Locations');
    final _projectTags = GlobalKey(debugLabel: 'Project Tags');

    if (title == "View\nProjects") {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ViewProjectsPage()));
    } else if (title == "Delete\nProject") {
      new Container(
        width: 450.0,
      );
      showDialog<Null>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('SEARCH  PROJECTS', style: TodoColors.textStyle,),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  SizedBox(height: 12.0),
                  TextField(
                    key: _projectTitle,
                    controller: _projectTitleController,
                    decoration: InputDecoration(
                      labelText: 'Project Title',
                      labelStyle: TodoColors.textStyle2,
                      border: CutCornersBorder(),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    key: _projectLocations,
                    controller: _projectLocationsController,
                    decoration: InputDecoration(
                      labelText: 'Project Location',
                      labelStyle: TodoColors.textStyle2,
                      border: CutCornersBorder(),
                    ),
                  ),
                  RaisedButton(
                    child: Text('ADD LOCATION'),
                    elevation: 8.0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    key: _projectTags,
                    controller: _projectTagsController,
                    decoration: InputDecoration(
                      labelText: 'Project Tag',
                      labelStyle: TodoColors.textStyle2,
                      border: CutCornersBorder(),
                    ),
                  ),
                  RaisedButton(
                    child: Text('ADD TAG'),
                    elevation: 8.0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(height: 12.0),
                ],
              ),

            ),

            actions: <Widget>[
              FlatButton(
                child: Text('CANCEL'),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              RaisedButton(
                child: Text('SEARCH'),
                elevation: 8.0,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {},
              ),

            ],
          );
        },
      );
    }
  }
}

class _BackgroundImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = new Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}