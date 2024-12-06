import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        // Adipisicing id ut adipisicing esse duis reprehenderit ex aliqua non nostrud proident veniam magna aliquip. Irure labore ipsum dolor est et dolore irure proident proident culpa aute tempor et. Nisi proident ea do ad id mollit ea amet id voluptate enim tempor pariatur ipsum.

        // Nisi amet ea ullamco ipsum cupidatat cupidatat ullamco aliquip reprehenderit ullamco. Dolore consectetur tempor amet ex occaecat commodo. Sint mollit excepteur dolor non culpa nulla sint. Est Lorem elit do magna ullamco officia irure amet ipsum duis ea. Ea dolore velit voluptate adipisicing cupidatat incididunt est veniam cillum dolor. Irure anim ad cillum fugiat proident enim veniam commodo ex. Eu ea eiusmod labore labore duis ex.

// Aliquip ea aute nulla tempor. Ad laborum cillum qui deserunt proident. Excepteur veniam sit duis ad elit consectetur consectetur velit pariatur in cupidatat irure. Ipsum sit labore Lorem occaecat cillum eiusmod eiusmod. Aliqua excepteur esse Lorem aute nulla commodo aliqua deserunt officia cillum ut proident. Velit sint voluptate sunt excepteur anim labore deserunt amet nisi officia ut.

// Nisi consectetur exercitation consequat non cupidatat eu. Elit incididunt sit laboris reprehenderit deserunt cupidatat et ex aliquip aliqua aute. Aliqua enim mollit sit incididunt. Excepteur excepteur fugiat enim voluptate sit proident voluptate nulla quis deserunt aliqua commodo occaecat quis. Exercitation laboris deserunt cupidatat ad ut sint. Exercitation est commodo et elit proident minim do duis occaecat velit. Ex elit anim eu excepteur cupidatat do ut anim amet.

// Proident irure ex adipisicing exercitation culpa sit dolore fugiat ullamco ex velit magna. Magna velit ea esse deserunt occaecat et ut cupidatat fugiat excepteur excepteur ullamco fugiat. Id labore cillum magna ullamco occaecat et. Dolore mollit ea esse mollit veniam sunt nisi. Consequat excepteur proident aute elit nisi irure cillum sint. Ea nulla eu ipsum irure laborum in exercitation. Nulla occaecat laboris velit do eu sit pariatur culpa eiusmod elit eiusmod exercitation laborum aliqua.

// Exercitation mollit aliquip magna nostrud aliqua et pariatur eiusmod. Amet sint enim laborum qui aliqua aliqua id nostrud mollit mollit laborum cupidatat incididunt sit. Ex aliquip et nulla enim proident excepteur laborum mollit laborum id labore esse. Anim esse quis ea aliqua ullamco Lorem qui eu laboris duis dolor.

// Duis laborum reprehenderit aliqua pariatur officia esse enim exercitation irure ipsum nisi adipisicing. In ex anim consequat excepteur. Id id nisi consequat nulla Lorem tempor cillum eu voluptate Lorem esse. Tempor in sit est ipsum tempor. In veniam et pariatur sint elit labore. Eiusmod fugiat ea eiusmod aliqua ex aute consequat ex laboris ad eu voluptate. Ut laboris adipisicing et aute sunt do ullamco mollit dolor quis laboris.

// Consequat esse minim labore tempor ut labore nisi aliquip aute irure. Officia culpa aute exercitation elit cupidatat est cupidatat sunt aliqua consectetur. Cillum ad duis et id enim ex do excepteur ad. Ea cillum fugiat ut aute veniam. Ut sint nulla eu eu occaecat. Reprehenderit ad officia amet nisi laborum cillum occaecat tempor elit labore elit. Culpa duis sunt amet nisi qui pariatur veniam aliqua anim magna dolore.

// Ad laborum dolore non excepteur nulla adipisicing aute duis ea ea qui sit est. Velit irure duis consequat veniam fugiat ad sunt aliquip elit pariatur minim eu eiusmod. Ea amet culpa in nostrud nostrud occaecat dolore. Dolore ex irure occaecat fugiat reprehenderit quis aliquip. Amet magna commodo nostrud qui adipisicing fugiat consectetur.

// Ea adipisicing cupidatat et magna ea incididunt anim. Minim consequat elit nostrud enim ut. Amet ut consectetur non cillum culpa Lorem. Cupidatat aliqua elit est consequat.

// Ex velit fugiat ullamco elit mollit duis adipisicing irure esse. Do pariatur occaecat tempor aliqua. Fugiat laborum dolore consectetur pariatur quis veniam quis proident enim dolor ut enim voluptate. Ullamco ipsum non magna non cupidatat est.
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
