import 'package:bankboo/pages/dashboard/local_widgets/saving_book_tile.dart';
import 'package:bankboo/pages/saving_books/saving_books.dart';
import 'package:bankboo/pages/saving_books/saving_books_service.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavingBooksModalBottomsheet extends StatefulWidget {
  @override
  _SavingBooksModalBottomsheetState createState() => _SavingBooksModalBottomsheetState();
}

class _SavingBooksModalBottomsheetState extends State<SavingBooksModalBottomsheet> {

  @override
  void initState() {
    super.initState();
    initSavingBooks();
  }

  initSavingBooks() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<SavingBooksService>(context, listen: false).getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10)
      ),
      child: Consumer<SavingBooksService>(
        builder: (context, service, _) {
          int lengthData = service.savingBooks.data != null
          ? service.savingBooks.data.count != null ? service.savingBooks.data.count : 0
          : 0;

          List balances = lengthData == 0 ? [] : service.savingBooks.data.results.map((e) => e.balance).toList();
          int totalBalance = balances.isNotEmpty
          ? balances.fold(0, (value, element) => value + element)
          : 0;

          return Container(
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
                  balance: totalBalance,
                ),
                Expanded(
                  child: service.isBusy
                  ? Center(
                    child: loading(context, color: Palette.secondary, size: 20, width: 45, height: 45),
                  )
                  : lengthData == 0
                  ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container(
                        //   width: 180,
                        //   margin: EdgeInsets.only(bottom: 10),
                        //   child: Image.asset('lib/assets/credit_card.png'),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            '(T o T)',
                            style: TextStyle(color: Palette.textHint, fontSize: 28),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'Kamu belum punya buku tabungan',
                            style: TextStyle(color: Palette.textHint),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        
                      ],
                    ),
                  )
                  : Column(
                    children: List.generate(lengthData, (index) {
                      SavingBook savingBook = service.savingBooks.data.results[index];
                      return Column(
                        children: [
                          SavingBookTile(
                            isSelected: savingBook.id == service.savingBook.id,
                            margin: EdgeInsets.only(top: 15),
                            title: '${savingBook.bank.name}',
                            fontSize: 14.0,
                            icon: BankbooLightIcon.credit_card_front,
                            iconColor: Palette.secondary,
                            balance: savingBook.balance,
                            onTap: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setString('selected_saving_book_id', savingBook.id);
                              service.onSelectSavingBook(savingBook);
                              Navigator.pop(context);
                            },
                          ),
                          Divider(
                            height: 1,
                            color: Palette.textHint.withOpacity(0.2),
                          ),
                        ],
                      );
                    }).toList(),
                  )
                )

              ],
            ),
          );
        },
      ),
    );
  }
}