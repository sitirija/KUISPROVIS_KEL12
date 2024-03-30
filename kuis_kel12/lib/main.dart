import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz UI Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quiz UI Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Kelompok 12',
            ),
            const Text(
              '(2207308) Syifa Azzahra',
            ),
            const Text(
              '(2202014) Siti Rija Dana Prima',
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const SoalNo1();
                  }));
                },
                child: const Text('   Jawaban No 1   '),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const SoalNo2();
                  }));
                },
                child: const Text('   Jawaban No 2   '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SoalNo1 extends StatelessWidget {
  const SoalNo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100, left: 20, right: 80, bottom: 80),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 22, 24, 138),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    // Implement your logic to load or change profile picture here
                    backgroundImage: AssetImage('assets/profile_picture.png'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profil',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          // Implement your logic to change profile picture here
                        },
                        child: Text(
                          'Ubah Foto Profil',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildInputField(label: 'Nama Panjang', placeholder: 'Masukkan nama lengkap'),
                  SizedBox(height: 10),
                  _buildInputField(label: 'NIK', placeholder: 'Masukkan NIK anda'),
                  SizedBox(height: 10),
                  _buildInputField(
                    label: 'Tanggal Lahir',
                    placeholder: 'DD/MM/YYYY',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  SizedBox(height: 10),
                  _buildDropdownField(
                    label: 'Gender',
                    placeholder: 'Pilih gender',
                    items: ['Laki-laki', 'Perempuan'],
                    onChanged: (String? value) {
                      // Handle dropdown value change
                    },
                  ),
                  SizedBox(height: 10),
                  _buildInputField(
                    label: 'Email',
                    placeholder: 'Masukkan email anda',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),
                  _buildInputField(
                    label: 'Alamat Rumah',
                    placeholder: 'Masukkan alamat rumah',
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle form submission
                    },
                    child: Text('Simpan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String placeholder,
    TextInputType? keyboardType,
    int maxLines = 1,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            hintText: placeholder,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon: suffixIcon,
          ),
          keyboardType: keyboardType,
          maxLines: maxLines,
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String placeholder,
    required List<String> items,
    ValueChanged<String?>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: null,
          onChanged: onChanged,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            hintText: placeholder,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}

class SoalNo2 extends StatelessWidget {
  const SoalNo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {}, // ganti dengan fungsi yang ingin Anda panggil ketika gambar ditekan
                      child: Image.asset(
                        'assets/1.jpg', // ganti dengan path gambar Anda
                        width: 250, // sesuaikan dengan lebar persegi panjang
                        height: 50, // sesuaikan dengan tinggi persegi panjang
                        fit: BoxFit.cover, // sesuaikan sesuai kebutuhan Anda
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Implement notification action here
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Hai Budi Martami",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              wordSpacing: 2,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            "Tetap jaga kesehatan ya",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              wordSpacing: 2,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 25), // Jarak antara teks dan foto
                      Container(
                        width: 80, // Sesuaikan dengan lebar foto Anda
                        height: 150, // Sesuaikan dengan tinggi foto Anda
                        // Anda bisa menambahkan gambar di sini menggunakan Image.asset atau Image.network
                        // Contohnya:
                        child: Image.asset(
                          'assets/2.jpg',
                          fit: BoxFit.cover, // Menyesuaikan gambar untuk mengisi container dengan memotong atau memperbesar
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 5),
                  width: 250,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Cari pemeriksaan kesehatan",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15), // Tambahkan padding kiri
                child: const Text(
                  "Layanan Prodiax",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 237, 237),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(255, 65, 63, 63),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.list_alt_rounded,
                          color: Colors.orange,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ['Cari dan Pesan', 'Chat dengan CS', 'Hasil pemeriksaan'][index],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 80, // Sesuaikan tinggi sesuai kebutuhan Anda
            decoration: BoxDecoration(
              color: Colors.white, // Ganti warna sesuai kebutuhan Anda
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 65, 63, 63),
                width: 1, // Lebar border
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.check,
                    color: Colors.orange,
                  ),
                ),
                const Text(
                  "Gunakan Kode Rujukan Dokter",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 240, 237, 237),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Pesanan Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_searching),
            label: 'Lokasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Kontak Kami',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
        currentIndex: 0, // Ganti nilai ini sesuai dengan indeks item yang ingin Anda pilih secara default
        selectedItemColor: const Color.fromARGB(255, 65, 63, 63),
        unselectedItemColor: const Color.fromARGB(255, 65, 63, 63),
        onTap: (int index) {
          // Handle onTap event here
        },
      ),
    );
  }
}