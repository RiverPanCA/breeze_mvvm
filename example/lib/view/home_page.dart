import 'package:flutter/material.dart';
import 'package:simple_mvvm/simple_mvvm.dart';

import 'home_page_view_model.dart';

// annotation for base class structure
// ignore: must_be_immutable
class HomePage extends BaseScreenStatefulWidget {
  HomePage(
    HomePageViewModel viewModel, {
    Key? key,
    required this.title,
  }) : super(
          viewModel,
          key: key,
        );

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseState<HomePageViewModel, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${viewModel.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
