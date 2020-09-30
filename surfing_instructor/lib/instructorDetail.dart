import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InstructorDetailPage extends StatefulWidget {
  final instructorDetail;

  const InstructorDetailPage({Key key, this.instructorDetail})
      : super(key: key);

  @override
  _InstructorDetailPageState createState() => _InstructorDetailPageState();
}

class _InstructorDetailPageState extends State<InstructorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2 + 70.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/surfing.jpg'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height / 3 -
                    100.0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3 + 100.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                widget.instructorDetail.instructorName,
                                style: new TextStyle(
                                    color: Colors.black,
                                    fontSize: 28.0,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: <Widget>[
                                  getRatingStar(widget.instructorDetail.rating, 1),
                                  getRatingStar(widget.instructorDetail.rating, 2),
                                  getRatingStar(widget.instructorDetail.rating, 3),
                                  getRatingStar(widget.instructorDetail.rating, 4),
                                  getRatingStar(widget.instructorDetail.rating, 5),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    widget.instructorDetail.rating
                                        .roundToDouble()
                                        .toString(),
                                    style: new TextStyle(
                                        color: Colors.amber,
                                        fontSize: 18.0,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Text('My name is ' + widget.instructorDetail.instructorName + '! I\'m from Santa Monica, California. I\'m experienced more than 10 years surf instructor.',
                              style: new TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Raleway',
                                fontSize: 15.0,
                              ),),
                            ),
                            SizedBox(height: 20.0,),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Read more',
                                style: new TextStyle(
                                    color: Colors.deepOrange.withOpacity(0.5),
                                    fontFamily: 'Raleway',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                             Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '200',
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Raleway',
                                            fontSize: 19.0),
                                      ),
                                      SizedBox(height: 8.0,),
                                      Text(
                                        'Reviews',
                                        style: new TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Raleway',
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '4',
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Raleway',
                                            fontSize: 19.0),
                                      ),
                                      SizedBox(height: 8.0,),
                                      Text(
                                        'programs',
                                        style: new TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Raleway',
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 95.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0)),
                                    ),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '>',
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Raleway',
                                                  fontSize: 19.0),
                                            ),
                                            SizedBox(height: 8.0,),
                                            Text(
                                              'Availability',
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Raleway',
                                                  fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                      ),

                                  )
                                ],
                              ),

                          ],
                        ),

                    ),
                  ),
                ),
              ),
              Positioned(
                top: 260.0,
                right: 20.0,
                child: Hero(
                  tag: widget.instructorDetail.instructorPic,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(30 / 360),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75.0),
                        image: DecorationImage(
                            image: AssetImage(
                                widget.instructorDetail.instructorPic),
                            fit: BoxFit.cover),
                        border: Border.all(
                            width: 1.0,
                            color: Colors.black,
                            style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  getRatingStar(rating, int index) {
    if (rating >= index) {
      return Icon(
        Icons.star,
        color: Colors.amber,
        size: 17.0,
      );
    } else {
      return Icon(
        Icons.star,
        color: Colors.grey,
        size: 17.0,
      );
    }
  }
}
