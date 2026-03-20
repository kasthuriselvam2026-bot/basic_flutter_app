import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';


class NewAppTrain extends StatelessWidget {
  const NewAppTrain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.message_outlined),),
      drawer: Drawer(),
      appBar:AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Student details"),
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: Column(
        children: [
           ExpansionTileCard(
                leading: CircleAvatar(backgroundImage: NetworkImage("https://photodpshare.com/wp-content/uploads/2025/11/cute-cartoon-girl-images-for-whatsapp-dp-with-flowers.jpg"),radius:30,),
                title: Text("John"),
                subtitle: Text("8900889899"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.bloodtype),
                      Text("AB+")
                    ],
                  ),
                )
              ],)
  ]

      ),
    );
  }
}

