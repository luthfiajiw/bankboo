import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('2333647817', style: TextStyle(color: Palette.grey, fontSize: 12),),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.grey[100],
                        child: Row(
                          children: <Widget>[
                            Text("Bank Sampah Ngawi", style: TextStyle(color: Palette.textBlack, fontWeight: FontWeight.w600, fontSize: 14)),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 2.5, 0.0, 0.0),
                              child: Icon(Icons.keyboard_arrow_down, color: Palette.textHint, size: 20,),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.account_box),
                    onPressed: () {},
                    iconSize: 40,
                    color: Palette.textHint,
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 20),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Palette.primary,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Saldo Akhir', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Rp. 500.000', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 120,
                        decoration: BoxDecoration(
                          color: Palette.grey.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.call_made, size: 30, color: Palette.secondary,),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Setoran', style: TextStyle(color: Palette.textBlack, fontWeight: FontWeight.w500),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 120,
                        decoration: BoxDecoration(
                          color: Palette.grey.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.call_received, size: 30, color: Palette.secondary,),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text('Penarikan', style: TextStyle(color: Palette.textBlack, fontWeight: FontWeight.w500),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}