import 'package:bankboo/pages/dashboard/local_widgets/saving_book_tile.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:flutter/material.dart';

class SavingBooksModalBottomsheet extends StatefulWidget {
  @override
  _SavingBooksModalBottomsheetState createState() => _SavingBooksModalBottomsheetState();
}

class _SavingBooksModalBottomsheetState extends State<SavingBooksModalBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10)
      ),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: MediaQuery.of(context).size.height * .96,
        // padding: EdgeInsets.only(top: 20.0, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              padding: EdgeInsets.symmetric(vertical: 15.0),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Text('Tutup', style: TextStyle(color: Palette.textBlack),)
                          )
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text('Pilih Buku Tabungan', style: TextStyle(color: Palette.textBlack, fontSize: 16)),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),

            SavingBookTile(
              title: 'Total',
              margin: EdgeInsets.symmetric(vertical: 15.0),
              fontSize: 16.0,
              icon: BankbooLightIcon.globe,
              iconColor: Palette.primary,
              balance: 100000,
            ),
            SavingBookTile(
              margin: EdgeInsets.only(top: 15),
              title: 'Buku Tabungan Bank Sampah Ngawi',
              fontSize: 14.0,
              icon: BankbooLightIcon.credit_card_front,
              iconColor: Palette.secondary,
              balance: 100000,
            ),
            Divider(
              height: 1,
              color: Palette.textHint.withOpacity(0.2),
            ),
            SavingBookTile(
              title: 'Buku Tabungan Bank Sampah Sejahtera',
              fontSize: 14.0,
              icon: BankbooLightIcon.credit_card_front,
              iconColor: Palette.secondary,
              balance: 100000,
            ),

          ],
        ),
      ),
    );
  }
}