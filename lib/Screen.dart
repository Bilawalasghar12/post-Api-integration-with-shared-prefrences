import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model class.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model class.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text('listTile'),
        ),
        body: FutureBuilder<SkillDetail>(
            future: getBbb(),
            builder: (context, AsyncSnapshot<SkillDetail> snapshot) {
              return snapshot.hasData
                  ?
              ListView.builder(
                  itemCount: snapshot.data!.data.all.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image.network(
                              ('${snapshot.data!.data.all[index].pngImage}'),
                              height: 70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text('${snapshot.data!.data.all[index].name}'),
                                SizedBox(
                                  height: 25,
                                ),
                                Text('${snapshot.data!.data.all[index].id}', )
                              ],
                            ),
                          ],
                        )
                      ],
                    );
                  }
              )

                  : CircularProgressIndicator();
            }));
  }

  Future<SkillDetail> getBbb() async {
    final token = await getStringValuesSF();
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Accept": "application/json"
    };

    String x = "https://staging.get-licensed.co.uk/guardpass/api/skill/all";


    final response = await http.get(
      Uri.parse(
        x,
      ),
      headers: headers,
    );

    var data = jsonDecode(response.body);
    print(data);

    return SkillDetail.fromJson(data);
  }

   Future<String?> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString('stringValue');
    return stringValue;
  }




}
