import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabSwipe extends StatefulWidget {
  const TabSwipe();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TabSwipe> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 20,
              width: 20,
            ),
            Spacer(),
            Container(
              width: 400,
              child: TabBar(
                labelColor: Color.fromRGBO(4, 2, 46, 1),
                labelStyle: theme.textTheme.headline1,
                indicatorColor: Color.fromRGBO(4, 2, 46, 1),
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                tabs: [
                  Text('الفاتورة',style: TextStyle(fontSize: 20),),
                  Text('دليفري', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: TabBarView(
          controller: tabController,
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}