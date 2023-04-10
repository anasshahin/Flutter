import 'package:flutter/material.dart';
import 'package:sdk_09_2021_flutter/WidgetCatalog/Utils/random_color.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  _ScaffoldWidgetState createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  int currentIndex = 0;

  bottomBarIndexChanger(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget bodyScreens(int index) {
    var all = [
      MyBodyScreen(icon: Icons.home,color: RandomColor.generateColor() ,onTap: () {}),
      MyBodyScreen(icon: Icons.favorite,color: RandomColor.generateColor() ,onTap: () {}),
      MyBodyScreen(icon: Icons.more,color: RandomColor.generateColor(), onTap: () {}),
      MyBodyScreen(icon: Icons.ac_unit,color: RandomColor.generateColor(), onTap: () {}),
    ];
    return all[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(
        //   Icons.add_circle,
        // ),
        title: Text('Scaffold Widget'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more),
            onPressed: () {},
          ),
        ],
        backgroundColor: RandomColor.generateColor(),
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 70),
          child: SizedBox(
            height: 60,
            child: Center(
              child: Text(
                'Flexible Space',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            child: Text(
              'bottom',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          preferredSize: Size(100, 70),
        ),
      ),
      body: bodyScreens(currentIndex),
      drawer: Drawer(
        semanticLabel: 'SDK Scaffold',
        elevation: 20,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("xyz"),
              accountEmail: Text("xyz@sdk.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("xyz"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("abc"),
                )
              ],
            ),
            ListTile(
              title: Text("All Inboxes"),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text("Primary"),
              leading: Icon(Icons.inbox),
            ),
            ListTile(
              title: Text("Social"),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("Promotions"),
              leading: Icon(Icons.local_offer),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        semanticLabel: 'SDK Scaffold',
        elevation: 20,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("xyz"),
              accountEmail: Text("xyz@sdk.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("xyz"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("abc"),
                )
              ],
            ),
            ListTile(
              title: Text("All Inboxes"),
              leading: Icon(Icons.mail),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text("Primary"),
              leading: Icon(Icons.inbox),
            ),
            ListTile(
              title: Text("Social"),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text("Promotions"),
              leading: Icon(Icons.local_offer),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: RandomColor.generateColor(),
        currentIndex: currentIndex,
        onTap: bottomBarIndexChanger,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'ac unit'),
        ],
      ),
    );
  }
}

class MyBodyScreen extends StatelessWidget {
  const MyBodyScreen(
      {Key? key,
      required this.icon,
      this.color = Colors.black,
      required this.onTap})
      : super(key: key);
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          size: 100,
          color: color,
        ),
      ),
    );
  }
}
