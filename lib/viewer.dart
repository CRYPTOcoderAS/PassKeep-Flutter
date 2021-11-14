import 'package:flutter/material.dart';
import 'package:passkeep/addpass.dart';
import 'package:passkeep/gloab.dart';
import 'package:passkeep/lowlevel/file.dart';
import 'package:passkeep/passViewer.dart';
import 'package:passkeep/widgets.dart';
import 'package:passkeep/entry.dart';

class ViewerInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          return Viewer(snap.data['data']);
        }
        return Loading();
      },
    );
  }
}

class Viewer extends StatelessWidget {
  final List<dynamic> data;
  Viewer(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/icon.png"),
                backgroundColor: Colors.white,
                //backgroundImage: Image(image: AssetImage('images/logo.jpg', width: 100.0, height: 100.0)),
              ),
              accountEmail: Text(
                "https://sachan1.netlify.app/",
                style: TextStyle(color: Colors.blue),
              ),
              accountName: Text('Akshat Sachan',
                  style: TextStyle(fontSize: 24.0, color: Colors.teal)),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            ListTile(
              // leading: const Icon(Icons.house),
              title: const Text(
                'THANKS FOR USING !!',
                style: TextStyle(fontSize: 24.0, color: Colors.blue),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Entry(
                        //text: 'Houses',
                        ),
                  ),
                );
              },
            ),
            ListTile(
              // leading: const Icon(Icons.apartment),
              title: const Text(
                '\n\nMADE BY : Akshat Sachan\n\n',
                style: TextStyle(fontSize: 18.0),
              ),

              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Entry(),
                    //  title: 'Apartments',
                  ),
                  // ),
                );
              },
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'images/logo.jpg',
                width: 800.0,
                height: 800.0,
              ),
              //backgroundImage: Image(image: AssetImage('images/logo.jpg', width: 100.0, height: 100.0)),
            ),
          ],
        ),
      ),
      // appBar: _appBar(),
      backgroundColor: back,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: accent,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPass()));
        },
      ),
      body: SafeArea(
        child: Container(
          child: ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PassViewer(data[i])));
              },
              child: Center(
                  child: Container(
                width: MediaQuery.of(context).size.width - 15,
                height: 40,
                color: accent,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      data[i]['site'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )),
            ),
            separatorBuilder: (context, i) => Container(
              height: 10,
            ),
          ),
        ),
      ),
    );
  }
}
