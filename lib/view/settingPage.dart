import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingPage extends StatelessWidget {
  //final FileTransfer client;
  late String _ipaddr;
  late String _port;


  void changeIpAddress(String value) {
    _ipaddr = value;
  }

  void changePort(String value) {
    _port = value;
  }


  @override
  Widget build(BuildContext context) {
    List<String> arg = ModalRoute.of(context)!.settings.arguments as List<String>;
    _ipaddr = arg[0];
    _port = arg[1];

    return Scaffold(
      resizeToAvoidBottomInset: false,  // キーボード表示時のエラー回避
      appBar: AppBar(
        title: const Text("Setting Connect Server"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0,bottom: 0),
            child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Host Name or IP Address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Flexible(
                      child: TextField(
                          keyboardType: TextInputType.text,
                          controller: TextEditingController(text: _ipaddr),
                          onChanged: changeIpAddress,
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Port Nummber',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        controller: TextEditingController(text: _port),
                        keyboardType: TextInputType.number,
                        onChanged: changePort,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],),
                    ),
                  ],
                )),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context, [_ipaddr, _port]);
              },
              child: const Text("転送先変更")),
        ],
      ),
    );
  }
}
