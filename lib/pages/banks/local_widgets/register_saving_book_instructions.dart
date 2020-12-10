import 'package:bankboo/shared/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class RegisterSavingBookInstructionsModal extends StatelessWidget {
  final Function onTap;

  const RegisterSavingBookInstructionsModal({Key key, this.onTap}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Palette.tertiary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        // color: Palette.primary,
        padding: EdgeInsets.all(20),
        child: IntroSlider(
          isScrollable: true,
          nameNextBtn: 'Next',
          nameSkipBtn: 'Skip',
          nameDoneBtn: 'OK',
          sizeDot: 5,
          colorDot: Colors.white,
          colorActiveDot: Colors.white,
          typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
          styleNameDoneBtn: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          styleNameSkipBtn: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          onDonePress: onTap,
          slides: [
            Slide(
              title: 'Langkah 1',
              pathImage: "lib/assets/online_research.png",
              description: "Mulai cari bank sampah yang ada di lingkungan sekitarmu, kemudian tap salah satu bank yang kamu pilih.",
              styleDescription: TextStyle(color: Colors.white),
              styleTitle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
              backgroundColor: Palette.tertiary
            ),
            Slide(
              title: 'Langkah 2',
              pathImage: "lib/assets/authentication.png",
              description: "kemudian tap \"Bergabung\" pada tampilan profile bank untuk meminta persetujuan pembuatan buku tabungan.",
              styleDescription: TextStyle(color: Colors.white),
              styleTitle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
              backgroundColor: Palette.tertiary
            ),
            Slide(
              title: 'Langkah 3',
              pathImage: "lib/assets/loading.png",
              description: "Tunggu sampai pihak bank mengonfirmasi permintaan kamu untuk bergabung dan membuat buku tabungan.",
              styleDescription: TextStyle(color: Colors.white),
              styleTitle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
              backgroundColor: Palette.tertiary
            ),
            Slide(
              title: 'Langkah 4',
              pathImage: "lib/assets/money_transfer.png",
              description: "Setelah berhasil bergabung, buku tabunganmu pun berhasil dibuat dan kamu bisa memulai transaksi setor sampah. Selesai deh!",
              styleDescription: TextStyle(color: Colors.white),
              styleTitle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
              backgroundColor: Palette.tertiary
            ),
          ]
        ),
      ),
    );
  }
}