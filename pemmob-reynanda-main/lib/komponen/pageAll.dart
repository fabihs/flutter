import 'package:flutter/material.dart';
import 'package:tugas_aplikasi/beranda/nonton.dart';
import 'package:tugas_aplikasi/komponen/list_film.dart';
import 'package:tugas_aplikasi/komponen/list_recom.dart';
import 'package:tugas_aplikasi/komponen/list_resume.dart';
import 'package:tugas_aplikasi/komponen/movie_detail.dart';

class PageAll extends StatelessWidget {
  const PageAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10),
        scrollDirection: Axis.horizontal,
        child: GestureDetector(
          child: const Row(
            children: [
              MyMovieList(
                gmb: "assets/image/film1.jpg",
                target: MyDetail(),
              ),
              MyMovieList(
                gmb: "assets/image/film2.jpg",
                target: MyDetail(),
              ),
              MyMovieList(
                gmb: "assets/image/film3.jpg",
                target: MyDetail(),
              ),
              MyMovieList(
                gmb: "assets/image/film4.jpg",
                target: MyDetail(),
              ),
            ],
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 15, left: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Continue Watching",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MyListResume(
              pict: "assets/image/film5.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Nonton(
                      pict: "assets/image/film5.jpg",
                      video:
                          "https://firebasestorage.googleapis.com/v0/b/flutterkonek.appspot.com/o/Wreck-It%20Ralph.mp4?alt=media&token=269bf91a-2c9a-4c04-8f0d-9b7cea0772bb",
                      title: 'Wreck-It Ralph',
                      judul: "Wreck-It Ralph",
                      desc:
                          "Wreck-It Ralph ingin disayang banyak orang seperti temannya yang baik hati, Fix-It Felix. Namun tidak ada orang yang suka dengan karakter jahat seperti Ralph, sehingga saat ada adu tembak di sebuah game pimpinan Sersan Calhoun, Ralph pun bersemangat mengikutinya. Tujuan Ralph pun sederhana, ingin menang dan mendapat medali agar dianggap sebagai pahlawan. Namun tanpa sadar Ralph malah membuka jalan bagi para penjahat yang dapat membunuh semua games di kompleks permainan itu. Satu-satunya harapan Ralph adalah Vanellope von Schweetz, yang juga dapat mengajarkan Ralph menjadi karakter yang baik hati. Namun apakah Ralph mempunyai waktu, sebelum para penjahat mematikan seluruh game yang ada?",
                    ),
                  ),
                );
              },
            ),
            MyListResume(
              pict: "assets/image/film6.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Nonton(
                      pict: "assets/image/film6.jpg",
                      video:
                          "https://firebasestorage.googleapis.com/v0/b/flutterkonek.appspot.com/o/WAKTU%20MAGHRIB.mp4?alt=media&token=41f26ea3-7d0a-46d1-9c63-8f4e4e376a74",
                      title: 'Waktu Maghrib',
                      judul: "Waktu Maghrib",
                      desc:
                          "Adi dan Saman sering dihukum oleh Bu Woro, guru mereka yang disiplin dan galak. Suatu hari, kekesalan Adi dan Saman terhadap Bu Woro memuncak. Mereka menyumpahi guru itu bersamaan dengan kumandang adzan Maghrib.",
                    ),
                  ),
                );
              },
            ),
            MyListResume(
              pict: "assets/image/film7.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Nonton(
                      pict: "assets/image/film7.jpg",
                      video:
                          "https://firebasestorage.googleapis.com/v0/b/flutterkonek.appspot.com/o/TRIPLE%20THREAT.mp4?alt=media&token=f89769cf-320f-4c34-af6a-264fda1bfe48",
                      title: 'Triple Threat',
                      judul: "Triple Threat",
                      desc:
                          "Xian (Celina Jade) adalah anak dari seorang milyuner yang nyawanya terancam. Ia akhirnya meminta bantuan kepada sekelompok pembunuh bayaran (Iko Uwais, Tony Jaa dan Tiger Hu Chen). Ketiganya akan berhadapan dengan sekelompok pembunuh bayaran lainnya (Scott Adkins, Michael Jai White, Michael Bisping) yang memiliki misi membunuh Xian.",
                    ),
                  ),
                );
              },
            ),
            MyListResume(
              pict: "assets/image/film8.jpg",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Nonton(
                      pict: "assets/image/film8.jpg",
                      video:
                          "https://firebasestorage.googleapis.com/v0/b/flutterkonek.appspot.com/o/SAW%20X.mp4?alt=media&token=4a2c2c8d-7c75-47b0-a6fc-6bda47bc6f70",
                      title: 'Saw X',
                      judul: "Saw X",
                      desc:
                          "Mengejar prosedur yang menjanjikan bahwa ia akan sembuh dari kanker yang diduga olehnya, John Kramer menuju ke Meksiko untuk menjalani perawatan eksperimental, hanya untuk menemukan bahwa ia adalah mangsa dari penipuan. Sekarang, para penipu menjadi mangsa dalam permainan baru Jigsaw.",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 17, left: 10),
        child: Row(
          children: [
            Text(
              "Rey",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              " - Recommended Movies",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Nonton(
                      pict: "assets/image/film9.jpg",
                      video:
                          "https://firebasestorage.googleapis.com/v0/b/flutterkonek.appspot.com/o/Longing%20for%20You.mp4?alt=media&token=9f557b22-e878-4f5d-8906-49b9533faa07",
                      title: 'Longing For You',
                      judul: "Longing For You",
                      desc:
                          "Kisah perjuangan seorang detektif bernama Oh Jin Sung dalam mengungkapkan kasus pembunuhan berantai yang melibatkan dan menewaskan adik laki-lakinya, Oh Jin Woo.",
                    ),
                  ),
                );
              },
              child: const MyRecom(recm: "assets/image/film9.jpg"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Nonton(
                      pict: "assets/image/film10.jpg",
                      video:
                          "https://firebasestorage.googleapis.com/v0/b/flutterkonek.appspot.com/o/Turning%20Red.mp4?alt=media&token=fbc50ba7-97be-49c1-bf20-ffddcd20cdac",
                      title: 'Turning Red',
                      judul: "Turning Red",
                      desc:
                          "Meilin Lee, seorang gadis berusia 13 tahun yang berubah menjadi panda merah raksasa setiap kali dia mengalami emosi yang kuat. Mei adalah gadis yang percaya diri dan ambisius, tetapi dia juga sangat perfeksionis dan memiliki tuntutan yang tinggi terhadap dirinya sendiri.",
                    ),
                  ),
                );
              },
              child: const MyRecom(recm: "assets/image/film10.jpg"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Nonton(
                      pict: "assets/image/film11.jpg",
                      video:
                          "https://firebasestorage.googleapis.com/v0/b/flutterkonek.appspot.com/o/Bulan%20Terbelah%20Di%20Langit%20Amerika.mp4?alt=media&token=352ed490-3726-4875-be3c-4ed5c125cdd9",
                      title: 'Bulan Terbelah di Langit Amerika',
                      judul: "Bulan Terbelah di Langit Amerika",
                      desc:
                          "Setelah mendapat kiriman email video seorang gadis berjudul “Do you know my dad?”, Hanum (Acha Septriasa), jurnalis yang bekerja di sebuah kantor berita Wina, diberi tugas untuk menulis artikel provokatif berjudul “Apakah dunia lebih baik tanpa Islam?”. Untuk menjawabnya, Hanum harus bertemu dengan korban tragedi 911 di New York: Azima Hussein (Rianti Cartwright), seorang mualaf yang bekerja di sebuah museum, dan anaknya , Sarah Hussein. Pada saat bersamaan, Rangga (Abimana Aryasatya) suaminya, juga ditugasi oleh Profesornya untuk mewawancarai seorang milyuner dan filantrop Amerika Phillipus Brown, demi melengkapi persyaratan S3 nya. Brown dikenal tidak mudah berbicara dengan media. Rangga diminta untuk menemui Stefan (Nino Fernandez) dan kekasihnya Jasmine (Hannah Al Rasyid) yang berada di New York yang telah mengatur pertemuan eksklusif dengan Brown. Tugas mereka berantakan ketika sebuah demosntrasi besar berakhir ricuh dan membahayakan keselamatan mereka.",
                    ),
                  ),
                );
              },
              child: const MyRecom(recm: "assets/image/film11.jpg"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Nonton(
                      pict: "assets/image/film12.png",
                      video:
                          "https://firebasestorage.googleapis.com/v0/b/flutterkonek.appspot.com/o/The%20Day%20After%20Tomorrow.mp4?alt=media&token=e0d68b49-6fd6-4a85-ae12-5574ef6ce971",
                      title: 'The Day After Tomorrow 2',
                      judul: "The Day After Tomorrow 2",
                      desc:
                          "Two astronauts looking down at Earth from the International Space Station, showing most of the northern hemisphere covered in ice, including all of the United States north of the southern states, and a major reduction in pollution.",
                    ),
                  ),
                );
              },
              child: const MyRecom(recm: "assets/image/film12.png"),
            ),
          ],
        ),
      ),
    ]);
  }
}
