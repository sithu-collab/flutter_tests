import 'package:flutter/material.dart';
import './models/instructors_model.dart';
import 'instructorDetail.dart';
class ListOfInstructorsPage extends StatefulWidget {

  @override
  _ListOfInstructorsPageState createState() => _ListOfInstructorsPageState();
}

class _ListOfInstructorsPageState extends State<ListOfInstructorsPage> {
  final allInstructors = instructor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Santa Monica, CA',
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconSize: 25.0,
                        color: Colors.black,
                        onPressed: () {},
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Best surfing instructors in Santa Monica, California!',
                    style: new TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontFamily: 'Raleway',
                    ),
                  ),
                   SizedBox(height: 10.0,),
                   Padding(
                     padding: EdgeInsets.only(left: 10.0, right: 10.0),
                     child: TextField(
                       decoration: InputDecoration(
                         icon: Icon(Icons.search),
                         hintText: 'Search',
                         suffixIcon: IconButton(
                           icon: Icon(Icons.filter_list),
                           iconSize: 25.0,
                           onPressed: () {},
                           color: Colors.grey,
                         ),
                       ),
                     ),

                   ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 220.0,
            child: GridView.count(
                crossAxisCount: 3,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 0.5,
              children: <Widget>[
                ...instructor.map((e){
                  return _builtInstructorCard(e);
                }).toList()

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _builtInstructorCard(Instructor instructor){
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push((MaterialPageRoute(
          builder: (context) => InstructorDetailPage(instructorDetail: instructor,)
        )));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 200.0,
              width: 120.0,
              color: Colors.transparent,
            ),
            Positioned(
              top: 60.0,
              left: 30.0,
              child: Container(
                height: 60.0,
                width: 50.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 12.0,
                      blurRadius: 6.0,
                      offset: Offset(5, 10),
                    )
                  ]
                ),
              ),
            ),
            Positioned(
              top: 15.0,
              child: Hero(
                tag: instructor.instructorPic,
                child: Container(
                  height: 130.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(instructor.instructorPic),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 160.0,
              left: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(instructor.instructorName,
                    style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Raleway'
                    ),),
                  SizedBox(height: 8.0,),
                  Row(
                    children: <Widget>[
                      getRatingStar(instructor.rating, 1),
                      getRatingStar(instructor.rating, 2),
                      getRatingStar(instructor.rating, 3),
                      getRatingStar(instructor.rating, 4),
                      getRatingStar(instructor.rating, 5),

                      SizedBox(width: 8.0,),
                      Text(instructor.rating.roundToDouble().toString(),
                      style: new TextStyle(
                        color: Colors.amber,
                        fontSize: 14.0,
                        fontFamily: 'Raleway',
                      ),),

                    ],
                  )
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
  getRatingStar(rating, index){
    if(rating >= index){
      return Icon(
        Icons.star,
        color: Colors.amber,
        size: 10.0,
      );
    }else{
      return Icon(
        Icons.star,
        color: Colors.grey,
        size: 10.0,
      );
    }
  }
}
