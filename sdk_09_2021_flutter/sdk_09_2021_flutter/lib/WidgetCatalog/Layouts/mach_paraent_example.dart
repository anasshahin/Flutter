import 'package:flutter/material.dart';

class MatchParentPage extends StatefulWidget {
  @override
  _MatchParentPageState createState() => _MatchParentPageState();
}

class _MatchParentPageState extends State<MatchParentPage> {
  BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Parent'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            // shares space constraint evenly with other Expanded
            child: Center(
              // ← fills tight parent constraint & loosens ↓ child constraint ↓
              child: Container(
                  // got loose constraint from Center...
                  constraints: constraints,
                  // can apply many additional constraints
                  color: Colors.lightBlueAccent.withOpacity(.3),
                  child: Text('Center > Container > Text')),
            ),
          ),
          Expanded(
            child: Container(
                color: Colors.orangeAccent,
                child: Wrap(children: [
                  _button(label: 'default'),
                  _button(
                      label: '*expand()', constraints: BoxConstraints.expand()),
                  _button(
                      label: '*tight(Size.infinite)',
                      constraints: BoxConstraints.tight(Size.infinite)),
                  _button(
                      label: 'tight(Size.zero)',
                      constraints: BoxConstraints.tight(Size.zero)),
                  _button(
                      label: 'tight(Size.fromHeight(100))',
                      constraints: BoxConstraints.tight(Size.fromHeight(100))),
                  _button(
                      label: 'tight(Size.fromWidth(100))',
                      constraints: BoxConstraints.tight(Size.fromWidth(100))),
                  _button(
                      label: 'tightForFinite(width: 100, height: 100)',
                      constraints: BoxConstraints.tightForFinite(
                          width: 100, height: 100)),
                  _button(
                      label: 'loose(Size.infinite)',
                      constraints: BoxConstraints.loose(Size.infinite)),
                  _button(
                      label: 'tightFor(width: double.infinity)',
                      constraints:
                          BoxConstraints.tightFor(width: double.infinity)),
                  _button(
                      label: 'tightFor(height: double.infinity)',
                      constraints:
                          BoxConstraints.tightFor(height: double.infinity)),
                ])),
          )
        ],
      ),
    );
  }

  Widget _button({String? label, BoxConstraints? constraints}) {
    bool _active = this.constraints == constraints;
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: RaisedButton(
        color: _active ? Colors.cyanAccent : null,
        child: Text(label!),
        onPressed: () {
         setState(() {
           this.constraints = constraints;
           print('$constraints');
         });
        },
      ),
    );
  }
}
