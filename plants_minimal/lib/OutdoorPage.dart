import 'package:flutter/material.dart';
import 'package:plants_minimal/plantDetail.dart';

void main() {
  runApp(new MaterialApp(
    home: OutdoorPage(),
  ));
}

class OutdoorPage extends StatefulWidget {
  @override
  _OutdoorPageState createState() => _OutdoorPageState();
}

class _OutdoorPageState extends State<OutdoorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 180.0,
            width: 300.0,
            child: Column(
              children: <Widget>[
                _buildPlantCard('images/plant_7.jpg', 'Outdoor', 'Mutual', '\$35.0'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Description',
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 18.5,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: 10.0,),
                Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s'
                    ' standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                  style: new TextStyle(
                    color: Colors.grey,
                    fontSize: 14.5,
                    fontFamily: 'Montserrat',
                  ),),
              ],
            ),
          )

        ],
      ),

    );
  }
  _buildPlantCard(String imgPath, String plantType, String plantName, String price){
    return InkWell(
      onTap: () {
        Navigator.of(context).push((MaterialPageRoute(
          builder: (context) => PlantDetail(heroTag: imgPath, type: plantType, name: plantName, price: price,)
        )));
      },
      child: Container(
        height: 400.0,
        width: 300.0,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 350.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Positioned(
                  top: 50.0,
                  left: 50.0,
                  child: Hero(
                    tag: imgPath,
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75.0),
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.black,
                            width: 0.5,
                          ),
                          image: DecorationImage(
                              image: AssetImage(imgPath),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  )
              ),
              Positioned(
                top: 20.0,
                right: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'FROM',
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 19.5,
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    Text(
                      price,
                      style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 19.5,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 198.0,
                left: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      plantType,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 18.5,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      plantName,
                      style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 20.5,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 0.5,
                                  color: Colors.white
                              )
                          ),
                          child: IconButton(
                            icon: Icon(Icons.wb_sunny),
                            iconSize: 25.0,
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 8.0,),
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 0.5,
                                  color: Colors.white
                              )
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.autorenew),
                            iconSize: 25.0,
                            color: Colors.white,
                          ),

                        ),
                        SizedBox(width: 8.0,),
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 0.5,
                                  color: Colors.white
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, right: 10.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.timeline),
                              iconSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          '?',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        )

                        ,
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 310.0,
                left: 100.0,
                child: Container(
                  height: 70.0,
                  width: 70.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.add_shopping_cart),
                    iconSize: 30.0,
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),

        ),
      ),

    );
  }
}
