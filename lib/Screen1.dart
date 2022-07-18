import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'datamodel.dart';

class Screen1Demo extends StatefulWidget {
  const Screen1Demo({Key? key}) : super(key: key);

  @override
  State<Screen1Demo> createState() => _Screen1DemoState();
}


Future<DataModel?> submitData(String name, String job) async {
  var response = await http.post(Uri.http('reqres.in', 'api/users '),
      body: {"name": name, "job": job});
  var data = response.body;
  print(data);
  if (response.statusCode == 201) {
    String responseString = response.body;
    dataModelFromJson(responseString);
  } else
    return null;
}

class _Screen1DemoState extends State<Screen1Demo> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController jobscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'http Demo',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'enter name'),
              controller: namecontroller),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'enter job name'),
              controller: jobscontroller),
          ElevatedButton(
              onPressed: () async {
                String name = namecontroller.text;
                String job = jobscontroller.text;
                DataModel? data = await submitData(name, job);
                setState(() {
                });
              },
              child: Text('submit')),
        ]),
      ),
    );
  }
}


