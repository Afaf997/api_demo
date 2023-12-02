import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

String? stringResponse;
Map? mapResponse;
Map? dataResponse;
List? listResponse;

class _HomescreenState extends State<Homescreen> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse =response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['data'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 39, 61),
        title: Text("API_demo",style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(listResponse?[index]['avatar']),
              ),
              title: Text(listResponse![index]['id'].toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listResponse![index]['email'].toString(),
                    style:const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 8, 77, 133)),
                  ),
                  Text(
                    listResponse![index]['first_name'].toString(),
                    style:const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 95, 18, 13)),
                  ),
                  Text(
                    listResponse![index]['last_name'].toString(),
                    style:const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 95, 18, 13)),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: listResponse == null ? 0 : listResponse?.length,
      ),
    );
  }
}




// body:Center(child: Container(
      //   height: 200,
      //   width: 300,
      //   decoration: BoxDecoration(
      //     borderRadius:BorderRadius.circular(20),color: Colors.amber[100],
      //   ),
      //   // child: Text(stringResponse.toString()),
      //   child: Center(
      //     child:listResponse == null? Text("Data is loading") 
      //     :Text(listResponse![0].toString())),
      // ),