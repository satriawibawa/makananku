import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:makananku/detail_makanan.dart';
import 'package:makananku/model/makanan.dart';

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int selectedIndex = 0;
  final List<String> kategori = [
    'Kateg. Mkn1',
    'Kateg. Mkn2',
    'Kateg. Mkn3',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.cyan,
        index: 2,
        items: <Widget>[
        Container(
          width: 50.0,
          height: 50.0,
          child: Center(
            child: Icon(Icons.fastfood, color: Color(0xFFFFAC60),),
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          child: Center(
            child: Icon(Icons.shopping_cart, color: Color(0xFFFFAC60),),
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          child: Center(
            child: Icon(Icons.home, color: Color(0xFFFFAC60),),
          ),
        ),
        Container(
          width: 60.0,
          height: 60.0,
          child: Center(
            child: Icon(Icons.settings, color: Color(0xFFFFAC60),),
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          child: Center(
            child: Icon(Icons.account_balance, color: Color(0xFFFFAC60),),
          ),
        ),
      ],),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          _buildButtonSideMenu(),
          _buildTitleScreen(),
          _buildMenuTypeFood(),
          _buildSearchFavorite(),
          _buildRestaurantMain(context),
        ],
      ),
    );
  }

  Padding _buildRestaurantMain(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.86,
            width: double.infinity,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: item.length,
              itemBuilder: (BuildContext context, int index) {
                    return  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_)=> DetailMakanan(makanan: item[index],)));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        height: MediaQuery.of(context).size.width * .6,
                        width: MediaQuery.of(context).size.width * .6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 10.0,
                            )
                          ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 180.0,
                              width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage(item[index].imageUrl),
                                      fit: BoxFit.cover)
                                ),
                            ),
                            SizedBox(height: 10.0,),
                            Text(item[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'lato',
                              fontSize: 20.0,
                              color: Color(0xFF444444),
                            ),),
                            SizedBox(height: 5.0,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(item[index].description,
                              textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.grey,
                                  ),),
                            ),
                            SizedBox(height: 15.0,),

                            Text('Tersedia/habis',
                            style: TextStyle(color: Color(0xFF404040), fontSize: 16.0),),

                            Padding(
                              padding: const EdgeInsets.only(left: 0.0, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('\Rp.${item[index].price}',
                                  style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),)
                                ],
                              ),
                            ),

                          ],
                        ),

                      ),
                    );
              }),
          ),
        );
  }

  Padding _buildSearchFavorite() {
    return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            width: double.infinity,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 440,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.cyan.withOpacity(0.6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.search, size: 25.0,color: Colors.white,),
                          Container(
                            height: 40,
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Cari',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }

  Padding _buildMenuTypeFood() {
    return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            width: double.infinity,
            height: 60.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: kategori.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      width: 160.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: index == selectedIndex ? Colors.cyan : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 10.0,
                          ),
                        ],),
                     child: Center(
                       child: Text(
                         kategori[index],
                         style: TextStyle(
                             color: index == selectedIndex
                                 ? Colors.white
                                 : Colors.cyan,
                         fontSize: 16.0,
                         fontFamily: 'lato',
                         fontWeight: FontWeight.bold,),
                       ),
                     ),

                    ),
                  );
                }),
          ),
        );
  }

  Padding _buildTitleScreen() {
    return Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10),
          child: Text('Daftar Makanan',
            style: TextStyle(
              fontSize: 30.9,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
              fontFamily: 'lato'
            ),),
        );
  }

  Padding _buildButtonSideMenu() {
    return Padding(
          padding: const EdgeInsets.only(left: 0.0, top: 10),
          child: Row(

            children: <Widget>[
              SizedBox(width: 20,),
              Icon(Icons.menu,)
            ],
          )
    );
  }
}