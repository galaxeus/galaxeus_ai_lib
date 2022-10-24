import 'dart:io';
import 'dart:isolate';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:galaxeus_ai_dart/galaxeus_ai_dart.dart';
import 'package:galaxeus_lib/galaxeus_lib.dart';

void main() {
  EventEmitter eventEmitter = EventEmitter();

  GalaxeusAiNative galaxeusAiNative = GalaxeusAiNative(
    galaxeusAiLib: "galaxeus_ai.so",
    galaxeusAiMemory: GalaxeusAiMemory(
      onData: (data) async {
        print(data);
        GalaxeusAiMemoryData();
        return null;
      },
    ),
  );

  runApp(MyApp(
    eventEmitter: eventEmitter,
    galaxeusAiNative: galaxeusAiNative,
  ));
}

extension Widg on Widget {
  helo() {}
}

Map? widgetToJson(data) {
  if (data is Widget) {
    Widget widget = data;
    if (widget is MaterialApp) {
      return {"@type": widget.toStringShort(), "home": widgetToJson(widget.home)};
    }
    if (widget is Scaffold) {
      return {
        "@type": widget.toStringShort(),
        "appBar": widgetToJson(widget.appBar),
        "body": widgetToJson(widget.body),
        "floatingActionButton": widgetToJson(widget.floatingActionButton),
      };
    }
    if (widget is AppBar) {
      return {"@type": widget.toStringShort(), "title": widgetToJson(widget.title)};
    }
    if (widget is Center) {
      return {
        "@type": widget.toStringShort(),
        "heightFactor": widget.heightFactor,
        "widthFactor": widget.widthFactor,
        "child": widgetToJson(widget.child),
      };
    }
    if (widget is Column) {
      return {
        "@type": widget.toStringShort(),
        "mainAxisAlignment": widget.mainAxisAlignment.toString(),
        "mainAxisSize": widget.mainAxisSize.toString(),
        "crossAxisAlignment": widget.crossAxisAlignment.toString(),
        "textDirection": widget.textDirection.toString(),
        "verticalDirection": widget.verticalDirection.toString(),
        "textBaseline": widget.textBaseline.toString(),
        "children": widget.children.map((e) => widgetToJson(e)).toList(),
      };
    }
    if (widget is Row) {
      return {
        "@type": widget.toStringShort(),
        "mainAxisAlignment": widget.mainAxisAlignment.toString(),
        "mainAxisSize": widget.mainAxisSize.toString(),
        "crossAxisAlignment": widget.crossAxisAlignment.toString(),
        "textDirection": widget.textDirection.toString(),
        "verticalDirection": widget.verticalDirection.toString(),
        "textBaseline": widget.textBaseline.toString(),
        "children": widget.children.map((e) => widgetToJson(e)).toList(),
      };
    }
    if (widget is Text) {
      return {
        "@type": widget.toStringShort(),
        "data": widget.data,
        "style": widgetToJson(widget.style),
        "strutStyle": widgetToJson(widget.strutStyle),
        "textAlign": widget.textAlign.toString(),
        "textDirection": widget.textDirection.toString(),
        "locale": widget.locale.toString(),
        "softWrap": widget.softWrap,
        "overflow": widget.overflow.toString(),
        "textScaleFactor": widget.textScaleFactor,
        "maxLines": widget.maxLines,
        "semanticsLabel": widget.semanticsLabel,
        "textWidthBasis": widget.textWidthBasis.toString(),
        "textHeightBehavior": widget.textHeightBehavior.toString(),
        "selectionColor": widget.selectionColor.toString(),
      };
    }
    if (widget is FloatingActionButton) {
      return {"@type": widget.toStringShort(), "child": widgetToJson(widget.child), "tooltip": widget.tooltip};
    }
    if (widget is Icon) {
      return {"@type": widget.toStringShort(), "icon": widgetToJson(widget.icon)};
    }
    return {"@type": widget.toStringShort()};
  }
  if (data is IconData) {
    return {"@type": "IconData", "codePoint": data.codePoint};
  }
  return null;
}

class MyApp extends StatelessWidget {
  final GalaxeusAiNative galaxeusAiNative;
  final EventEmitter eventEmitter;
  MyApp({
    super.key,
    required this.galaxeusAiNative,
    required this.eventEmitter,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SpeechToText(
        eventEmitter: eventEmitter,
        galaxeusAiNative: galaxeusAiNative,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final GalaxeusAiNative galaxeusAiNative;
  const MyHomePage({super.key, required this.title, required this.galaxeusAiNative});

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
  late String result = "";

  void _incrementCounter() {
    print(widgetToJson(body()));
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
    return body();
  }

  Widget body() {
    return Scaffold(
      appBar: AppBar(
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
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              result,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult? resul = await FilePicker.platform.pickFiles();

          if (resul != null) {
            File file = File(resul.files.single.path!);
            if (file.existsSync()) {
              Future(() {
                GalaxeusAiNativeResponse res = widget.galaxeusAiNative.request(
                  galaxeusAiNativeRequest: GalaxeusAiNativeRequest.playAudioFromFile(
                    audio: file,
                  ),
                );
                setState(() {
                  result = res.toString();
                });
              });
            }
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SpeechToText extends StatefulWidget {
  final GalaxeusAiNative galaxeusAiNative;
  final EventEmitter eventEmitter;
  SpeechToText({Key? key, required this.galaxeusAiNative, required this.eventEmitter}) : super(key: key);

  @override
  State<SpeechToText> createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  late String model = "/sdcard/models/ggml-model-whisper-small.bin";
  late String audio = "/sdcard/models/output_res.wav";
  late String result = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    task();
  }

  task() async {
    final recvPort = ReceivePort();

    await Isolate.spawn<SendPort>((port) {
      print('[2] received port');

      final recvMsg = ReceivePort();

      port.send(recvMsg.sendPort);

      print('[2] sent my port');

      recvMsg.listen((message) {
        print('[2] Received ${message.name}');

        port.send('Thanks for ${message.name}!');
      });
    }, recvPort.sendPort);

    final recvStream = recvPort.asBroadcastStream();
    final sendPort = await recvStream.first;

    print('[1] Sending Foo');

    widget.eventEmitter.on("update", context, (ev, context) {
      print("mulai");
      GalaxeusAiNativeResponse res = widget.galaxeusAiNative.request(
        galaxeusAiNativeRequest: GalaxeusAiNativeRequest.speechToTextFromWavFile(
          threads: 4,
          // auto convert to wav
          // audio: GalaxeusAiAudioConvert.convertToWav16BitSync(
          //   audioInput: File("./audio.mp3"),
          //   audioOutput: File("../../native_lib/samples/output_res.wav"),
          // ),
          audio: File(audio),
          model: File(model),
        ),
      );
      setState(() {
        result = res.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? resul = await FilePicker.platform.pickFiles();

                      if (resul != null) {
                        File file = File(resul.files.single.path!);
                        if (file.existsSync()) {
                          setState(() {
                            model = file.path;
                          });
                        }
                      }
                    },
                    child: Text("set model"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? resul = await FilePicker.platform.pickFiles();

                      if (resul != null) {
                        File file = File(resul.files.single.path!);
                        if (file.existsSync()) {
                          setState(() {
                            audio = file.path;
                          });
                        }
                      }
                    },
                    child: Text("set audio"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (audio.isEmpty) {
                        return;
                      }
                      if (model.isEmpty) {
                        return;
                      }
                      widget.eventEmitter.emit("update", null, "azka");
                      print("ok");
                    },
                    child: Text("Start"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("model: ${model}"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("audio: ${audio}"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("Result: ${result}"),
            ),
          ],
        ),
      ),
    );
  }
}
