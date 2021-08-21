import 'package:flutter/material.dart';

import 'package:trackr/presentation/common/common.dart';

class App extends StatelessWidget {
  const App({required String appTitle}) : _appTitle = appTitle;

  final String _appTitle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: Scaffold(
        appBar: AppBar(title: Text(_appTitle)),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Hello $_appTitle'),
            const Text('すべての機器は生命体だ'),
            ElevatedButton(onPressed: () {}, child: const Text('button')),
          ],
        )),
      ),
    );
  }
}
