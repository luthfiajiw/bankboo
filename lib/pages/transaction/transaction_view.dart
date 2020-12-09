import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/deposit_tile.dart';
import 'package:bankboo/shared/widgets/withdrawal_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: Text('Transaksi', style: TextStyle(fontSize: 18, color: Colors.white),),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 15, 15, 15),
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
                  return _currentIndex == 1
                  ? WithdrawalTile(
                    date: '20 Mei 2020',
                    amount: 100000,
                    status: 'Sukses',
                  )
                  : DepositTile(
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
    );
  }
}