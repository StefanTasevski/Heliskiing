import 'dart:async';
import 'package:HelioTours/HelioTour.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = new Set();
  List<HelioTour> toursList = new List();

  @override
  void initState() {
    super.initState();
    _fillList();
    _createMarkers();
  }

  void _createMarkers() {
    for (HelioTour item in toursList) {
      markers.add(_createMarker(item.id, item.lat, item.long, item.name, item.url));
    }
  }

  void _fillList() {
    toursList.add(new HelioTour("1", 42.470134, 44.491694, "Gudauri", "Perfect mountains. Unlimited helicopter flights. Highest safety standards.","https://www.heliskiadventure.com/gudauri-heli-skiing/","https://www.cityam.com/wp-content/uploads/2019/05/mainy-5bc0d04fd9b45-960x600.jpg"));
    toursList.add(new HelioTour("2", 43.420666, 40.349466,"Highland Abkhazia", "Highland Abkhazia is our main winter playground.","http://www.sochi-heliski.ru/en/zasnezhennye-gory-solnechnoj-abhazii/","http://www.sochi-heliski.ru/wp-content/uploads/2015/10/20180107-IMG_4749_Lr_S-1024x683.jpg"));
    toursList.add(new HelioTour("3", 55.247222, 108.719587, "Baikal Lake", "The ice does not skim the clear waters of the lake.","http://www.sochi-heliski.ru/en/sibir-bajkal/","http://www.sochi-heliski.ru/wp-content/uploads/2018/09/baikal_heliski_02_1.jpg"));
    toursList.add(new HelioTour("4", 69.165505, 96.163635, "Western Siberia", "Best powder of Siberia. Fantastic forest riding.","http://www.sochi-heliski.ru/en/siberia/","http://www.sochi-heliski.ru/wp-content/uploads/2018/10/IMG_2242_1_site.jpg"));
    toursList.add(new HelioTour("5", 56.245945, 159.377329, "Kamchatka", "Kamchatka is one of the best heli-region in the world.","http://www.sochi-heliski.ru/en/kamchatka/","http://www.sochi-heliski.ru/wp-content/uploads/2016/09/foto1.jpg"));
    toursList.add(new HelioTour("6", 42.671760, 0.992597, "The Pyrenees", "Ideal to explore the Pyrenees, perfect for all nature lovers.","https://www.pyrenees-heliski.pro/en/home_en/","https://www.pyrenees-heliski.pro/wp-content/uploads/2018/10/Home.Pirineos.2.jpg"));
    toursList.add(new HelioTour("7", 45.939003, 7.612574, "Cervinia", "An unforgettable off-piste helicopter.","https://www.heliskicervinia.com/page.asp?ID=2","https://www.heliskicervinia.com/public/uploads/heliski_s_1.jpg"));
    toursList.add(new HelioTour("8", 44.949751, 6.897175, "Sestriere Piedmont", "The heli skiing piedmont area is known for its snow diversity.","https://www.heli-guides.com/en/destinations/italy-sestriere-treeskiing/","https://previews.123rf.com/images/faabi/faabi1603/faabi160300208/56478157-view-over-the-snow-clad-slopes-of-sestriere-in-the-milky-way-ski-resort-in-piedmont-.jpg"));
    toursList.add(new HelioTour("9", 45.908687, 6.915502, "Chamonix Mont Blanc", "Chamonix, the “Freeride-capital” of the Alps, does not need many words.","https://www.heli-guides.com/en/destinations/france-chamonix-heliskiing/","https://d11qb5qfzmba7x.cloudfront.net/2015/2015-0829-MontMaudit/2015-0829-142042-3137.6.jpg"));
    toursList.add(new HelioTour("10", 46.510836, 10.139931, "Livigno Lombardia", "Livigno offers a unique ski and heliski adventure.","https://www.heli-guides.com/en/destinations/italy-heliskiing-livigno-lombardy-2/","https://media.skigebiete-test.de/images/ecu/entity/e_skiresort/ski-resort_livigno_n4326-22325-0_l.jpg"));
    toursList.add(new HelioTour("11", 45.810565, 7.863142, "Gressoney Monte Rosa", "This powder paradise offers a true mountain experience.","https://www.heli-guides.com/en/destinations/italy-gressoney-heliskiing-zermatt/","https://yakki-images.s3-eu-west-3.amazonaws.com/images/listing_images/images/2364709/big/gsj_1.jpg"));
    toursList.add(new HelioTour("12", 68.314074, 18.865517, "Abisko, Niehku", "Freeride and Heliski nearby the Arctic Circle in the far north of Sweden.","https://www.heli-guides.com/en/destinations/heliskiing-sweden-lyngen-alps/","https://www.outsideonline.com/sites/default/files/styles/full-page/public/2019/11/25/niehku-mountain-villa-drone-shot-erik-nissen-johansen_h.jpg"));
    toursList.add(new HelioTour("13", 68.423674, 18.165368, "Riksgränsen", "In this Heliski paradise we ski untracked snow until the end of May.", "https://www.mountainguide.se/upplev.asp?catId=5&languageId=44", "https://www.mountainguide.se/dbImages/1230_s300.jpg"));
    toursList.add(new HelioTour("14", 65.806679, -18.551347, "Iceland", "Welcome to a land of magical snow-capped mountains.","https://www.arcticheliskiing.com/en","https://mlrd6wezbfqm.i.optimole.com/cr8t1w-swSlSsQp/w:auto/h:auto/q:90/https://www.whatson.is/wp-content/uploads/2018/01/dsf0779j-res-min.jpg"));
    toursList.add(new HelioTour("15", 68.535537, -28.069487, "Greenland", "The nature of the area is also no less than spectacular.","https://www.arcticheliskiing.com/en/programs/greenland","https://www.telegraph.co.uk/content/dam/Travel/leadAssets/35/25/GRO_p-meier_001_3525954a.jpg"));
    toursList.add(new HelioTour("16", 46.893284, 9.287131, "Switzerland", "Switzerland is the perfect place to get a taste for heli-skiing.", "https://www.eaheliskiing.com/destinations/europe/switzerland", "https://www.eaheliskiing.com/admin/resources/002eaheliskiingswitzerland-w600h396.jpg"));
    toursList.add(new HelioTour("17", 40.066827, 22.388321, "Greece", "Greece is where heli-skiing meets the sacred, the spiritual and the mythical.", "https://www.eaheliskiing.com/destinations/europe/greece", "https://www.eaheliskiing.com/admin/resources/001greeceheliskimikearzt-w1500.jpg"));
    toursList.add(new HelioTour("18", 40.835120, 41.152955, "Turkey", "During the winter months enjoy incredible powder skiing conditions in Turkey.", "https://www.eaheliskiing.com/destinations/europe/turkey", "https://www.eaheliskiing.com/admin/resources/ph9328-1-w600h396.jpg"));
    toursList.add(new HelioTour("19", 42.754113, 0.828894, "Spain", "It is an area of incredible natural beauty, rich in flora and fauna.", "https://www.eaheliskiing.com/destinations/europe/spain", "https://www.eaheliskiing.com/admin/resources/002eaheliskiingspain-w600h396.jpg"));
    toursList.add(new HelioTour("20", 45.626453, 6.847661, "Val", "Anyone can do it. Skiers, snowboarders, singles, groups and families.", "https://valheliski.com/", "https://valheliski.com/valheli/wp-content/uploads/DSC_5327.jpg"));
    toursList.add(new HelioTour("21", 42.408196, 19.904026, "Albania", "Heli skiing in Albania is a unique experience, with some breathtaking views.", "https://www.heliskialbania.com/", "https://i.pinimg.com/originals/4d/9c/9a/4d9c9a8e003106ad0c15e4c5b3479d95.jpg"));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Heliskiing Tours"),
        backgroundColor: Colors.black54,
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _buildMapBoxList(),
        ],
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition:  CameraPosition(target: LatLng(42.470134, 44.491694), zoom: 9),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
      ),
    );
  }

  Future<void> _goToLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 9, tilt: 0.0,
      bearing: 0.0,)));
  }
  
  Widget _buildMapBoxList() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(children: <Widget>[
            for (HelioTour tour in toursList) 
            Row(
              children: <Widget>[
                SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _createMapBox(tour.imageUrl, tour.lat, tour.long, tour.name, tour.desc, tour.url),
                ),
              ]
            ),
            SizedBox(width: 10.0),
            ],)
          ],
        ),
      ),
    );
  }

  Widget _createMapBox(String _image, double lat,double long,String name, String desc, String url) {
    return  GestureDetector(
        onTap: () {
          _goToLocation(lat,long);
        },
        child:Container(
              child: new FittedBox(
                child: Material(
                    color: Theme.of(context).secondaryHeaderColor,
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Theme.of(context).splashColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(24.0),
                              bottomLeft: const Radius.circular(24.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: _image,
                              fit: BoxFit.fitHeight,
                              width: MediaQuery.of(context).size.width,
                              placeholder: (context, url) => Center(child:SizedBox(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                                ),
                                height: 40.0,
                                width: 40.0,
                              )),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            )
                          ),),
                          Container(
                          width: 180,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _createDetailsContainer(name, desc, url),
                          ),
                        ),

                      ],)
                ),
              ),
            ),
    );
  }

  Widget _createDetailsContainer(String name, String desc, String url) {
    return SizedBox( 
      width: 180,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0, top: 4.0),
            child: Container(
                child: Text(name,
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(height:5.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
            child: Container(
                    child: Text(
                  desc,
                  style: TextStyle(
                    color: Theme.of(context).splashColor,
                    fontSize: 16.0,
                  ),
                )),
          ),
          SizedBox(height:5.0),
          Expanded(child: 
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/webView', arguments: [url, name]);
                },
                elevation: 0.0,
                color: Colors.red,
                child: Text(
                  'Learn more',
                  style: TextStyle(fontSize: 20, color: Theme.of(context).secondaryHeaderColor),
                ),
              ),
            ),
          ),
        ],
      )
    ,);
  }

  Marker _createMarker(String id, double lat, double long, String name, String url) {
    return Marker(
      markerId: MarkerId(id),
      position: LatLng(lat, long),
      infoWindow: InfoWindow(title: name),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ), 
      onTap:() {
        Navigator.of(context).pushNamed('/webView', arguments: [url, name]);
      }
    );
  }
}