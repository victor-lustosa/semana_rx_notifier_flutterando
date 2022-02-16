import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Controller();
  // void _incrementCounter() {
  //   controller.counter.value++;
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   controller.counter.addListener(() {
  //     print(controller.counter.value);
  //   });
  // }
  @override
  void initState() {
    super.initState();
   rxObserver(() {
      print(controller.counter.value);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            RxBuilder( builder:(_){
            return Text(
            '${controller.counter.value}',
            style: Theme.of(context).textTheme.headline4,
                   );
                }
                // ValueListenableBuilder(valueListenable: controller.counter, builder:(_,__,___){
                //   return Text(
                //     '${controller.counter.value}',
                //     style: Theme.of(context).textTheme.headline4,
                //   );
                // }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
