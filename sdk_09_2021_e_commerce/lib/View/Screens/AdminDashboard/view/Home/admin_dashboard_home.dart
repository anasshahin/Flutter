import 'package:flutter/material.dart';
import 'package:sdk_09_2021_e_commerce/Utils/router/route_constant.dart';
import 'package:sdk_09_2021_e_commerce/Utils/theme_manager.dart';
import 'Compaonenet/linechart.dart';
import 'Compaonenet/linecharttwo.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeManager.accent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: PieChartSample2(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                children: [
                  DashboardCard(
                    color: Colors.grey,
                    text: '\$100K',
                    icon: Icons.person,
                    descriptionText: 'Users',
                    onTap: () {
                      Navigator.of(context).pushNamed(adminUserMainRoute);
                    },
                  ),
                  DashboardCard(
                    color: Colors.blueGrey,
                    text: '1000',
                    descriptionText: 'Categories',
                    icon: Icons.category_outlined,
                    onTap: () {
                      Navigator.of(context).pushNamed(adminCategoryMainRoute);
                    },
                  ),
                  DashboardCard(
                    color: Color(0xff09e5a5),
                    text: '350',
                    descriptionText: 'Products',
                    icon: Icons.attach_money,
                    onTap: () {
                      Navigator.of(context).pushNamed(adminProductMainRoute);
                    },
                  ),
                  DashboardCard(
                    color: Color(0xff069e79),
                    text: '20K',
                    descriptionText: 'Orders',
                    icon: Icons.shopping_bag_outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 1,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              shrinkWrap: true,
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    right: 5,
                    left: 5,
                    top: 5,
                  ),
                  child: LineChartSample(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//==============================================================================
//==============================================================================
//==============================================================================
class DashboardCard extends StatelessWidget {
  const DashboardCard(
      {Key? key,
      required this.color,
      required this.text,
      required this.icon,
      required this.descriptionText,
      required this.onTap})
      : super(key: key);
  final Color color;
  final String descriptionText;
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    descriptionText,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
              Icon(
                icon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
