import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'proc/client.dart';
import 'proc/server.dart';
import 'view/settingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'File Transfer ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'File Transfer Main Page!'),
        routes: <String, WidgetBuilder>{
          '/setting': (BuildContext context) => SettingPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FileSaveSrv srv = FileSaveSrv(port: 50052);
  FileTransfer ft = FileTransfer(address: "localhost", port: 50052);

  FilePickerResult? result;

  String ipAddress = "None";
  int port = 50051;
  String msg = "";

  // 初期化
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await srv.setServer();
    if (srv.srvState) {
      ipAddress = await srv.ipAddress;
      port = srv.port;
    }
    setState(() {});
  }

  @override
  void dispose() async {
    await srv.stopServer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,  // キーボード表示時のエラー回避
      appBar: AppBar(
        title: const Text("File Transfer---!"),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.settings),
            ),
            onTap: () async {
              final settingPage = await Navigator.pushNamed(
                  context, '/setting',
                  arguments: [ft.address,ft.port.toString()]
              ) as List<String>;
              setState(() {
                ft.address = settingPage[0];
                ft.port = int.parse(settingPage[1]);
              });
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(flex: 1),
          // サーバ表示用
          serverInfo(),
          Spacer(flex: 1),
          clientInfo(),
          Spacer(flex: 1),
          //ファイル名
          fileCardInfo(),
          Spacer(flex: 3),
          //ボタン処理
          ButtonProc(),
          Spacer(flex: 12),
        ],
      ),
    );
  }

  /* 表示用Widget */
  // サーバ表示用
  Widget serverInfo() {
    String srvMsg = "";
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 117,
        width: double.infinity,
        child: Card(
          color: srv.srvState ? Colors.white : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(8.0),
                child: const CircleAvatar(
                  radius: 20,
                  child: Text(
                    'My',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    srv.srvState
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  'IPAddr => $ipAddress',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  'Port => $port',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              StreamBuilder(
                                  stream: srv.srvmsg.stream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      srvMsg = snapshot.data as String;
                                    } else {
                                      srvMsg = "";
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        srvMsg,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          )
                        : const Text(
                            'サーバ停止中･･･。',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: Switch(
                  value: srv.srvState,
                  onChanged: (s) async {
                    if (s == false) {
                      srv.stopServer();
                    } else {
                      srv.setServer();
                    }
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget clientInfo() {
    String cliMsg = "";
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 117,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(8.0),
                child: const CircleAvatar(
                  radius: 20,
                  child: Text(
                    'To',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'IPAddr => ${ft.address}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Port => ${ft.port}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        StreamBuilder(
                            stream: ft.climsg.stream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                cliMsg = snapshot.data as String;
                              } else {
                                cliMsg = "";
                              }
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  cliMsg,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              );
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fileCardInfo() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Spacer(flex: 1),
              const Text(
                'Selected file:',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(result?.files[0].name ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold)),
              const Spacer(flex: 2),
              const Text("Message",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Text(msg,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold)),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget ButtonProc() {
    return Row(
      children: [
        const Spacer(
          flex: 1,
        ),
        // ファイル選択
        Center(
          child: ElevatedButton(
            onPressed: () async {
              result = await FilePicker.platform.pickFiles();
              if (result == null) {
                msg = "No file selected";
              } else {
                msg = "file selected";
              }
              setState(() {});
            },
            child: const Text("ファイル選択"),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        // アップロード処理
        Center(
          child: ElevatedButton(
            onPressed: () async {
              bool res;
              if (result == null) {
                msg = "ファイルがありません。";
              } else {
                PlatformFile file = result!.files.first;
                String? filepath = file.path;
                try {
                  File f = File(filepath!);
                  Uint8List bytes = f.readAsBytesSync();
                  res = await ft.fileTrans(file.name, bytes);
                } catch (e) {
                  res = false;
                }
                // output message
                msg = res ? "転送に成功しました。" : "転送に失敗しました。";
              }
              setState(() {});
            },
            child: const Text("アップロード"),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
