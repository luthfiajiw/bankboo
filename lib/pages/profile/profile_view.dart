import 'package:bankboo/core/constants/route_paths.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/profile_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage('lib/assets/bg-dashboard.png',),
                fit: BoxFit.cover
              )
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(top: 25.0),
                      width: MediaQuery.of(context).size.width * .5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(BankbooLightIcon.user, size: 60, color: Colors.white,),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text("Luthfi Aji Wicaksono", style: TextStyle(color: Colors.white, fontSize: 20.0), textAlign: TextAlign.center,),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 85, 25, 25),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Informasi Profil", style: TextStyle(color: Palette.textBlack,),),
                              InkWell(
                                onTap: () {},
                                splashColor: Colors.grey[100],
                                child: Text("Edit", style: TextStyle(color: Palette.tertiary),)
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: <Widget>[
                          ProfileTile(
                            leading: BankbooLightIcon.map_marker_alt,
                            title: "Alamat",
                            content: "Jl. Mertilang XII Blok KB3 No. 4, Pondok Pucung, Pondok Aren, Tangerang Selatan, Banten",
                          ),
                          SizedBox(height: 20,),
                          ProfileTile(
                            leading: BankbooLightIcon.phone,
                            title: "No. Handphone",
                            content: "082246854054",
                          )
                        ],
                      ),
                    )
                  ],
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();

                          prefs.clear();
                          Navigator.pushNamedAndRemoveUntil(context, RoutePaths.Signin, (Route<dynamic> route) => false);
                        },
                        child: Text('Log out', style: TextStyle(color: Colors.redAccent))
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.copyright, color: Palette.textBlack, size: 12,),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text('2020 Bankboo', style: TextStyle(color: Palette.textBlack, fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                )              
              ],
            ),
          )
        ],
      ),
    );
  }
}