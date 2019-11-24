import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:expandable_card/expandable_card.dart';
import 'package:flutter/material.dart';
// import 'package:hello/home.dart';
// import 'package:hello/comp.dart';
// import 'package:hello/fav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("news"),),
      body: ExpandableCardPage(
          page: Container(
            child: Center(
              child: Row(
                children: <Widget>[Text("Center Image")],
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: new NetworkImage(
                        "https://img.bleacherreport.net/img/images/photos/003/806/761/hi-res-05ac1ab41d028386a40c950207aa7bc6_crop_north.jpg?h=533&w=800&q=70&crop_x=center&crop_y=top"),
                    fit: BoxFit.cover)),
          ),
          expandableCard: ExpandableCard(
            padding: EdgeInsets.only(top: 0, left: 20, right: 20),
            minHeight: 225,
            maxHeight: 700,
            backgroundColor: Colors.white,
            hasRoundedCorners: true,
            hasHandle: false,
            hasShadow: true,
            children: <Widget>[
              Center(
                child: Text(
                  "______",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    button("Sports"),
                    SizedBox(
                      width: 10,
                    ),
                    button("Technology"),
                    SizedBox(
                      width: 10,
                    ),
                    button("Interiews"),
                    SizedBox(
                      width: 10,
                    ),
                    button("Politics"),
                    SizedBox(
                      width: 10,
                    ),
                    button("Stocks"),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              news(
                  "https://img.etimg.com/thumb/msid-71159812,width-300,imgsize-94638,resizemode-4/3.jpg",
                  "Hotels body seeks police probe against OYO"),
              news("https://akm-img-a-in.tosshub.com/indiatoday/images/story/201909/viratlkohlicatch__1_-770x433.jpeg?EonLd_DLNDnvX53TEOtUOEe0KlxQ9Ahs",
                  "Catch of the season: Virat Kohli's sensational effort wows fans"),
              news(
                  "https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-jsr6am4fk1dib4osgvhqo1n226-20190918003736.Medi.jpeg",
                  "After Shah Rukh Khan, Aamir Khan ropes in Yogi Babu"),
              news(
                  "https://www.hindustantimes.com/rf/image_size_960x540/HT/p2/2019/09/18/Pictures/_4d688bce-da11-11e9-b2f8-83b44344bbe7.png",
                  "‘Govt will implement NRC countrywide’, says Amit Shah"),
              news(
                  "https://mspoweruser.com/wp-content/uploads/2019/09/WhatsApp-Beta.jpg",
                  "WhatsApp now allows users to hide muted status updates"),
            ],
          ),
        ),
      bottomNavigationBar: FancyBottomNavigation(
         inactiveIconColor: Colors.grey,
         activeIconColor: Colors.redAccent,
         circleColor: Colors.white,
         textColor: Colors.redAccent,
        tabs: [
          TabData(
            iconData: Icons.home,
            title: "Home",
          ),
          TabData(
            iconData: Icons.whatshot,
            title: "Comptetion",
          ),
          TabData(iconData: Icons.wb_incandescent, title: "Table"),
          TabData(iconData: Icons.shopping_cart, title: "My Favourite")
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[Center(child: Text("Hello"),)],
        ),
      ),
    );
  }

  // _getPage(int page) {
  //   switch (page) {
  //     case 0:
  //       // return ExampleApp();
  //     case 1:
  //       // return Comp();
  //       case 2:
  //       //return Total();
  //     case 3:
  //       // return Fav();
  //     default:
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Text("This is the basket page"),
  //         ],
  //       );
  //   }
  // }
}

Widget button(var tittle) {
  return RaisedButton(
    shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0)),
    onPressed: () {},
    child: Text(
      tittle,
      style: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    color: Colors.redAccent,
  );
}

Widget news(var link, var tittle) {
  return Card(
    elevation: 2.0,
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 80,
              width: 90,
              child: Image.network(
                link,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: 200.0,
          child: Text(
            tittle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}