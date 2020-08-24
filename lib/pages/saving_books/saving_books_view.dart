import 'package:bankboo/pages/saving_books/local_widgets/saving_book_tile.dart';
import 'package:bankboo/pages/saving_books/saving_books.dart';
import 'package:bankboo/pages/saving_books/saving_books_service.dart';
import 'package:bankboo/shared/bankboo_light_icon_icons.dart';
import 'package:bankboo/shared/palette.dart';
import 'package:bankboo/shared/widgets/app_bar_module.dart';
import 'package:bankboo/shared/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavingBooksView extends StatefulWidget {
  @override
  _SavingBooksViewState createState() => _SavingBooksViewState();
}

class _SavingBooksViewState extends State<SavingBooksView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async => await Provider.of<SavingBooksService>(context, listen: false).getList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarModule(
        context,
        title: 'Buku Tabungan',
        onPop: () => Navigator.pop(context),
      ),
      body: Consumer<SavingBooksService>(
        builder: (context, service, _) {
          int lengthData = service.savingBooks.data != null
          ? service.savingBooks.data.count != null ? service.savingBooks.data.count : 0
          : 0;

          return service.isBusy
          ? Center(child: loading(context, color: Palette.secondary, size: 20, width: 45, height: 45))
          : ListView.separated(
            separatorBuilder: (context, index) => Divider(color: Palette.textHint.withOpacity(0.2), indent: 20, endIndent: 20,),
            itemCount: lengthData,
            itemBuilder: (context, index) {
              SavingBook savingBook = service.savingBooks.data.results[index];

              return SavingBookTile(
                title: savingBook.bank.name,
                margin: EdgeInsets.symmetric(vertical: 10),
                status: 'Aktif',
                fontSize: 16.0,
                icon: BankbooLightIcon.credit_card_front,
                iconColor: Palette.secondary,
                accountNumber: savingBook.number,
              );
            },
          );
        }
      ),
    );
  }
}