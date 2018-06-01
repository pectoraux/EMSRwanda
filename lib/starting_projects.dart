import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unit_converter/project_details.dart';

import 'shop_items_page.dart';

class StartingProjectPage extends StatefulWidget
{
  @override
  StartingProjectPageState createState() => StartingProjectPageState();
}

class StartingProjectPageState extends State<StartingProjectPage>
{
  static const _padding = EdgeInsets.all(5.0);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: Text('Search Results', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0)),
        actions: <Widget>
        [
          Container
          (
            margin: EdgeInsets.only(right: 8.0),
            child: Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>
              [
//                Text('TAP HERE', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 14.0)),
//                Icon(Icons.search, color: Colors.black54)
       new FloatingActionButton(
      elevation: 200.0,
      child: new Icon(Icons.search),
      backgroundColor: Colors.blue,
      onPressed:(){
        new Container(
          width: 450.0,
        );
        showDialog(context: context, child:
        new AlertDialog(
          contentPadding: _padding,
          title: new Text("Search For A Project",),
          content: new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.book),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Project Name",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_city),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Project Location",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.date_range),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "From",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.description),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: "Tags",
                    ),
                  ),
                ),
              ]),
        ),
        );
      },
    ),
              ],
            ),
          )
        ],
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Kigali, Gisenyi', style: TextStyle(color: Colors.blueAccent)),
                      Text('FSI', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                    ],
                  ),
                  Material
                  (
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Center
                    (
                      child: Padding
                      (
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                      )
                    )
                  )
                ]
              ),
            ),
          ),
          _buildTile(
            Padding
              (
              padding: const EdgeInsets.all(24.0),
              child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text('Remera, Gaculiro', style: TextStyle(color: Colors.blueAccent)),
                        Text('CookStoves', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                      ],
                    ),
                    Material
                      (
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center
                          (
                            child: Padding
                              (
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                            )
                        )
                    )
                  ]
              ),
            ),
          ),
          _buildTile(
            Padding
              (
              padding: const EdgeInsets.all(24.0),
              child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text('Kacyiru, Kimironko', style: TextStyle(color: Colors.blueAccent)),
                        Text('MISM', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                      ],
                    ),
                    Material
                      (
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center
                          (
                            child: Padding
                              (
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                            )
                        )
                    )
                  ]
              ),
            ),
          ),
          _buildTile(
            Padding
              (
              padding: const EdgeInsets.all(24.0),
              child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text('Kiyovu, Nyamirambo', style: TextStyle(color: Colors.blueAccent)),
                        Text('PEPSI', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                      ],
                    ),
                    Material
                      (
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center
                          (
                            child: Padding
                              (
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                            )
                        )
                    )
                  ]
              ),
            ),
          ),
          _buildTile(
            Padding
              (
              padding: const EdgeInsets.all(24.0),
              child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text('Kigali, Gaculiro', style: TextStyle(color: Colors.blueAccent)),
                        Text('Students Report', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                      ],
                    ),
                    Material
                      (
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center
                          (
                            child: Padding
                              (
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                            )
                        )
                    )
                  ]
              ),
            ),
          ),
          _buildTile(
            Padding
              (
              padding: const EdgeInsets.all(24.0),
              child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text('Kacyiru', style: TextStyle(color: Colors.blueAccent)),
                        Text('MISM', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                      ],
                    ),
                    Material
                      (
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center
                          (
                            child: Padding
                              (
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                            )
                        )
                    )
                  ]
              ),
            ),
          ),
          _buildTile(
            Padding
              (
              padding: const EdgeInsets.all(24.0),
              child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text('Kiyovu', style: TextStyle(color: Colors.blueAccent)),
                        Text('RRA Survey', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                      ],
                    ),
                    Material
                      (
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center
                          (
                            child: Padding
                              (
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                            )
                        )
                    )
                  ]
              ),
            ),
          ),
          _buildTile(
            Padding
              (
              padding: const EdgeInsets.all(24.0),
              child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text('Gisenyi', style: TextStyle(color: Colors.blueAccent)),
                        Text('ALI', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                      ],
                    ),
                    Material
                      (
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center
                          (
                            child: Padding
                              (
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                            )
                        )
                    )
                  ]
              ),
            ),
          ),
          _buildTile(
            Padding
              (
              padding: const EdgeInsets.all(24.0),
              child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text('Gaculiro', style: TextStyle(color: Colors.blueAccent)),
                        Text('LATI', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                      ],
                    ),
                    Material
                      (
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center
                          (
                            child: Padding
                              (
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                            )
                        )
                    )
                  ]
              ),
            ),
          ),
          _buildTile(
            Padding
              (
              padding: const EdgeInsets.all(24.0),
              child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>
                  [
                    Column
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Text('Remera', style: TextStyle(color: Colors.blueAccent)),
                        Text('VINE', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0))
                      ],
                    ),
                    Material
                      (
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center
                          (
                            child: Padding
                              (
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                            )
                        )
                    )
                  ]
              ),
            ),
          ),


        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
        ],
      )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell
      (
        // Do onTap() if it isn't null, otherwise do print()
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProjectDetailsPage())),
        child: child
      )
    );
  }
}