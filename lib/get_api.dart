import 'package:api_methods/api_services.dart';
import 'package:api_methods/datamodel.dart';
import 'package:flutter/material.dart';

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  late Welcome? welcome = Welcome.demo();
  var loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    welcome = (await ApiService().getWelcomes())!;
    if (welcome != null) {
      setState(() {
        loading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('listing users')),
        body: Visibility(
          visible: loading,
          replacement: const CircularProgressIndicator(),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                        children: [
                          Text(welcome!.name),
                          Text(welcome!.gender),
                          Text(welcome!.height),
                          Text(welcome!.birthYear),
                          Text(welcome!.eyeColor),
                          Text(welcome!.hairColor),
                          Text(welcome!.skinColor)
                        ],
                      ),
              ),
                  ),
        ));
  }
}
