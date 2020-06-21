import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/deposit_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionView extends StatefulWidget {
  @override
  _TransactionViewState createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  final List categories = ['Setoran', 'Penarikan'];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 105,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage('lib/assets/bg-dashboard.png',),
                fit: BoxFit.fill
              )
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(15.0, 20, 15, 0),
                  child: Text("Transaksi", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 50, 15, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * .8,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              splashColor: Colors.transparent,
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      categories[index],
                                      style: TextStyle(color: _currentIndex == index ? Palette.textBlack : Palette.textHint),
                                    ),
                                    AnimatedContainer(
                                      margin: EdgeInsets.only(top: 5),
                                      height: 2.0,
                                      width: _currentIndex == index ? 35.0 : 0.0,
                                      duration: Duration(milliseconds: 200),
                                      decoration: BoxDecoration(
                                        color: Palette.secondary,
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Icon(Icons.filter_list, color: Palette.textHint,)
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return DepositTile(
                          date: '20 Mei 2020',
                          category: 'Botol/Plastik',
                          status: 'Pending',
                          weight: 5,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}