import 'package:flutter/material.dart';
import 'package:passkeep/addpass.dart';
import 'package:passkeep/gloab.dart';
import 'package:passkeep/lowlevel/file.dart';
import 'package:passkeep/passViewer.dart';
import 'package:passkeep/widgets.dart';

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
