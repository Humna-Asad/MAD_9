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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Assignment No. 9'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin  {
  late TabController _controller;
  List<Widget>tabBarViews=[
    Center(child: Text('First view')),
    Center(child: Text('Second View'))
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: tabBarViews.length, vsync:this);
    _controller.addListener(() {
      print(_controller.index);
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: [Center(child: Icon(Icons.print)),
        Center(child: Icon(Icons.people))],
        
          controller: _controller,
        ),

        title: Text(widget.title),
      ),
      body: Center(

        child: TabBarView(
          children: tabBarViews,
          controller: _controller,


        ),
      ),

    );
  }
}
