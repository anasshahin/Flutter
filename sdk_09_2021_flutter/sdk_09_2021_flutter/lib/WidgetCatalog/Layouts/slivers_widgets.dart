import 'package:flutter/material.dart';

class SliversWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SliverFillRemaining')),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(const [
              ListTile(title: Text('First item')),
              ListTile(title: Text('Second item')),
              ListTile(title: Text('Third item')),
              ListTile(title: Text('Fourth item')),
              ListTile(title: Text('Fifth item')),
              ListTile(title: Text('Sixth item')),
              ListTile(title: Text('Seventh item')),
              ListTile(title: Text('Eighth item')),
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Container(
              color: Colors.yellowAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FlutterLogo(size: 200),
                  Expanded(
                    child: Text(
                      'This is some longest text that should be centered'
                      'together with the logo',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
