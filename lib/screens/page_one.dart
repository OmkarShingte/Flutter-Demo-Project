import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  /// The global key to access the animated list.
  final _animatedListKey = GlobalKey<AnimatedListState>();

  List<String> _items = [];

  @override
  void initState() {
    // Set the items that should be display.
    _items = ['A', 'B', 'D', 'E', 'F'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example')),
      body: AnimatedList(
        key: _animatedListKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(
              // Tween that slides from right to left.
              Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)),
            ),
            // Simply display the letter.
            child: ListTile(title: Text(_items[index])),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // The item to insert.
          final _item = 'C';

          // Add, sort, and retrieve the index of the inserted item.
          List<String> _temp = _items..add(_item);
          _temp.sort();
          final _index = _temp.indexOf(_item);

          // Update the state and start the animated list animation.
          setState(() {
            _items.insert(_index, _item);
            _animatedListKey.currentState?.insertItem(_index);
          });
        },
      ),
    );
  }
}