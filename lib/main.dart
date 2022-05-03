import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Named Routes Demo',
    // Routeの設定はmainのMaterialAppで設定
    initialRoute: '/',
    routes: {
      '/': (context) => const MyHomePage(title: 'MyHomePage'),
      '/screen4': (context) => const Screen4(),
    },
  ),
);

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Screen2(Push)'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
              },
            ),
            ListTile(
              title: const Text('Screen2(PushRep)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Screen2()));
              },
            ),
            ListTile(
                title: const Text('Screen3'),
                onTap: () async {
                  Navigator.pop(context);
                  var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Screen3()));
                  print(result);
                }
            ),
            ListTile(
                title: const Text('Screen4'),
                onTap: () {
                  Navigator.pop(context, true);
                  Navigator.pushNamed(context, '/screen4');
                }
            )
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen2")),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Screen3")),
        body: ElevatedButton(
          child: Text("戻る"),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen4'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
