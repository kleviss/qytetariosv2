import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:qytetarios/src/app.dart';
import 'package:qytetarios/src/models/category.dart';

import '../../wordpress_client.dart';

class DrawerMain extends StatefulWidget {
  DrawerMain({Key key}) : super(key: key);

  @override
  _DrawerMainState createState() => _DrawerMainState();
}

class _DrawerMainState extends State<DrawerMain> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 10.0,
        child: Container(
          color: Colors.transparent,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                child: Html(
                data: html,
                style: {
                  "html": Style(

                    backgroundColor: Colors.white,
                    color: Colors.black,
                  ),
                  "h1": Style(
                    fontSize: FontSize(38.0),
                  ),
                  "h3": Style(
                    fontSize: FontSize(28.0),
                  ),
                  "div": Style(
                    fontSize: FontSize(16.0),
                    textAlign: TextAlign.justify,
                    padding: const EdgeInsets.all(18.0),
                  ),
                }))



//                  Container(
//                    child: Column(
//                      children: <Widget>[
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
////                            Expanded(
////                              child: Container(
////                                alignment: Alignment.center,
////                                color: Colors.white,
////                                child: Text('Rreth Nesh:'),
////                              ),
////                            ),
//                          ],
//                        ),
//                        Expanded(
//                          child: html,
////                          FutureBuilder<List<Category>>(
////                            future: client.listCategories(),
////                            builder: (context, snapshot) {
////                              if (!snapshot.hasData) {
////                                return LinearProgressIndicator();
////                              } else {
////                                return ListView.builder(
////                                  itemCount: snapshot.data.length,
////                                  itemBuilder: (context, index) {
////                                    List<Category> _categories = snapshot.data;
////                                    return Container(
////                                      margin: EdgeInsets.only(top: 4),
////                                      color: Colors.white12,
////                                      height: 60,
////                                      child: ListTile(
////                                        title: Text(_categories[index].name),
////                                        leading: IconButton(
////                                          icon: const Icon(Icons.category),
////                                        ),
////                                        trailing: Container(
////                                            width: 0,
////                                            child:
////                                            Text(" ")),
////                                      ),
////                                    );
////                                  },
////                                );
////                              }
////                            },
////                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),

                )],
            ),
          ),
        ));
  }
}

Widget drawerBtn(String text, Function function) {
//String text ;

  return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          elevation: 2.0,
          //textTheme: ButtonTextTheme.primary,
          splashColor: Colors.cyan,
          textColor: Colors.black,
          colorBrightness: Brightness.dark,

          child: Text(text),

          padding: EdgeInsets.all(20.0),
          animationDuration: Duration(microseconds: 200),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(10.0))),
          color: Colors.amber,
          onPressed: function,
        ),
      ]);
}

//btn social
Widget socialBtn(String text, IconData iconData, Color color) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Padding(
        // padding: EdgeInsets.all(20.0),
        //),
        RaisedButton(
          child: Row(
            children: <Widget>[
              Icon(
                iconData,
                color: Colors.cyan,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text(
                text,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          elevation: 2.0,
          //textTheme: ButtonTextTheme.primary,
          splashColor: Colors.cyan,
          textColor: Colors.black,
          colorBrightness: Brightness.dark,
          padding: EdgeInsets.all(20.0),

          animationDuration: Duration(microseconds: 200),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.only(bottomLeft: Radius.circular(10.0))),
          color: color,
          onPressed: () {},
        ),
      ]);
}

Widget drawerBtnPadding() {
  return Padding(
    padding: EdgeInsets.all(5.0),
  );
}

const html = """
        <div>
          <h1>QytetarIN</h1>
          <p>QytetarIN është një nismë e Qëndresës Qytetare e mbështetur nga Lëviz Albania, nje projekt i Agjencise Zvicerane per Zhvillim dhe Bashkepunim SDC, e cila synon të rrisë pjesëmarrjen qytetare në vendimmarrjen e Këshillit Bashkiak Tiranë duke fuqizuar qytetarët, organizatat dhe grupet e interesit për të të luajtur një rol aktiv në përcaktimin e përparësive zhvillimore të komunitetit dhe territorit ku ato banojnë apo punonjë.</p>
          
          <h3> Adresa</h3>
          <ul>
            <p>Qëndresa Qytetare, Rruga Hoxha Tahsin, Pallati Vjerro, Ap. 23/A, Tiranë, Shqipëri
            </p>
          </ul>
          
          <h3> Kontakti</h3>
          <ul>
            <p>Email: <strong>qendresaqytetare@gmail.com</strong></p>
      
          </ul>
          
          <h3> Privacy Policy </h3>

          <p> Website jonë është http://qytetarin.com/ </p>
          <br>

          <p>Për të ushtruar të gjitha të drejtat përkatëse, bëni pyetje ose paraqisni 
          ankesa në lidhje me këtë politikë, ju lutemi na kontaktoni përmes WEBISTE na kontaktoni.
         
          </p>
        
          <b> Update në 27 Prill 2020 </b>

          <!--You can pretty much put any html in here!-->
        </div>
      """;
