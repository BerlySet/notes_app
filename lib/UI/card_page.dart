import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Promo Hari Ini",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue[100]],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight))),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Card(
              elevation: 10,
              child: Stack(
                children: <Widget>[
                  Opacity(
                      opacity: 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.toptal.com/designers/subtlepatterns/patterns/memphis-mini.png"),
                                fit: BoxFit.cover)),
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/Shopback.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Diskon Up To 90% Ramayana",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(
                              20,
                              MediaQuery.of(context).size.height * 0.35 + 50,
                              20,
                              15),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "1 Februari 2020  ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.red[900]),
                                ),
                                Text(
                                  "LIMITED!!",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.redAccent[700]),
                                ),
                            ]),
                        ),
                        Row(children: [
                          Spacer(flex: 10,),
                          Icon(Icons.thumb_up, size: 18, color: Colors.grey),
                          Spacer(flex: 1),
                          Text("99", style: TextStyle(color: Colors.grey, fontSize: 18),),
                          Spacer(flex: 5,),
                          Icon(Icons.comment, size: 18, color: Colors.grey),
                          Spacer(flex: 1,),
                          Text("109", style: TextStyle(color: Colors.grey, fontSize: 18),),
                          Spacer(flex: 10,),
                        ],)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
