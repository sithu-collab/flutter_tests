import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: DetailPage(),
  ));
}

class DetailPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  const DetailPage({this.heroTag, this.foodName, this.foodPrice});


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var selectedCard = 'WEIGHT';
  int _counter = 0;

  void _incrementCounter() {
   setState(() {
     _counter++;
   });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          iconSize: 22.0,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: new Text(
          'Details',
          style: new TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 20.0
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            color: Colors.white,
            iconSize: 25.0,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 80.0,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0)),
                  ),

                ),
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 65,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    height: 130.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                        width: 1.0
                      ),
                      borderRadius: BorderRadius.circular(70.0),
                      image: DecorationImage(
                        image: AssetImage(widget.heroTag),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200.0,
                left: 20.0,
                right: 20.0,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        widget.foodName,
                        style: new TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 33.0
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            widget.foodPrice,
                            style: new TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                            ),
                          ),
                          Container(
                            height: 45.0,
                            color: Colors.black,
                            width: 1.0,
                          ),
                          Container(
                            height: 45.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  color: Colors.white,
                                  iconSize: 30.0,
                                  onPressed: () {
                                    _decrementCounter();
                                  },
                                ),
                                Text(
                                  '$_counter',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle),
                                  color: Colors.white,
                                  iconSize: 30.0,
                                  onPressed: () {
                                    _incrementCounter();
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 25.0,),
                      Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _foodInfoCard('WEIGHT', '300', 'G'),
                            SizedBox(width: 10.0,),
                            _foodInfoCard('VITAMINS', 'A,B6', 'VIT'),                            SizedBox(width: 10.0,),
                            SizedBox(width: 10.0,),
                            _foodInfoCard('CALORIES', '500', 'CAL'),
                            SizedBox(width: 10.0,),

                            _foodInfoCard('FAT', '300', 'G'),
                            SizedBox(width: 10.0,),

                            _foodInfoCard('PROTEIN', 'A,B6', 'PRO'),
                            SizedBox(width: 10.0,),

                            _foodInfoCard('ZINC', '500', 'ZINC'),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.0,),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 0.4,
                                    blurRadius: 0.4
                                ),
                              ]
                          ),
                          child: Center(
                            child: new Text(
                              'Total ' + '\$53',
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
   Widget _foodInfoCard(String cardTitle, String info, String unit){
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        height: 100.0,
        width: 120.0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: cardTitle == selectedCard ? Colors.blueAccent.withOpacity(0.6) : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: cardTitle == selectedCard ? Colors.transparent : Colors.grey.withOpacity(0.5),
              spreadRadius: 0.4,
              blurRadius: 0.4

            ),

          ],
          border: Border.all(
            color: cardTitle == selectedCard ? Colors.transparent : Colors.grey,
            style: BorderStyle.solid,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cardTitle,
                style: new TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  color: cardTitle == selectedCard ? Colors.white : Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 40.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    info,
                    style: new TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: cardTitle == selectedCard ? Colors.white : Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    unit,
                    style: new TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17.0,
                      color: cardTitle == selectedCard ? Colors.white : Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              )

            ],

          ),
        )
      ),
    );
  }
  selectCard(cardTitle) {
    setState(() {
     selectedCard = cardTitle;
    });
  }

}
