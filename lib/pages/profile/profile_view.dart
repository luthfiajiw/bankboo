import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/profile_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 25.0),
                width: MediaQuery.of(context).size.width * .5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.account_box, size: 70, color: Colors.white,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("Luthfi Aji Wicaksono", style: TextStyle(color: Colors.white, fontSize: 20.0), textAlign: TextAlign.center,),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 65, 25, 25),
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
                      leading: Icons.location_on,
                      title: "Alamat",
                      content: "Jl. Mertilang XII Blok KB3 No. 4, Pondok Pucung, Pondok Aren, Tangerang Selatan, Banten",
                    ),
                    SizedBox(height: 20,),
                    ProfileTile(
                      leading: Icons.phone,
                      title: "No. Handphone",
                      content: "082246854054",
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}