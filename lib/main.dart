import 'package:flutter/material.dart';

class AppColors {
  static const pink = Color(0xFFEC407A);
  static const pinkTua = Color(0xFFC2185B);
  static const pinkMuda = Color(0xFFFCE4EC);
  static const background = Color(0xFFFFF5F8);
}

void main() {
  runApp(const DompetkuApp());
}

class DompetkuApp extends StatelessWidget {
  const DompetkuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dompetku',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.pink),
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Lapisan 1: foto background (aman kalau file tidak ada)
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: AppColors.background),
            ),
          ),

          // Lapisan 2: putih transparan
          Positioned.fill(
            child: Container(color: Colors.white.withOpacity(0.70)),
          ),

          // Lapisan 3: konten
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. HEADER
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColors.pinkMuda,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat pagi,',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Keysha Chayanna',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.notifications_none),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 2. KARTU SISA SALDO
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet,
                              color: Colors.white70,
                              size: 16,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Sisa saldo',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Rp255.000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.pinkMuda,
                              foregroundColor: AppColors.pinkTua,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TambahPage(),
                                ),
                              );
                            },
                            child: const Text('+ Catat Pengeluaran'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 3. KATEGORI
                  const Text(
                    'Kategori',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Expanded(
                        child: CategoryItem(
                          icon: Icons.restaurant,
                          label: 'Makan',
                        ),
                      ),
                      Expanded(
                        child: CategoryItem(
                          icon: Icons.two_wheeler,
                          label: 'Transport',
                        ),
                      ),
                      Expanded(
                        child: CategoryItem(
                          icon: Icons.school,
                          label: 'Kuliah',
                        ),
                      ),
                      Expanded(
                        child: CategoryItem(
                          icon: Icons.more_horiz,
                          label: 'Lainnya',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 4. RIWAYAT
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Riwayat',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Hari ini',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        HistoryItem(
                          icon: Icons.restaurant,
                          nama: 'Nasi goreng',
                          jam: '07.30',
                          nominal: '-Rp15.000',
                        ),
                        Divider(height: 1),
                        HistoryItem(
                          icon: Icons.two_wheeler,
                          nama: 'Ojek ke kampus',
                          jam: '08.10',
                          nominal: '-Rp12.000',
                        ),
                        Divider(height: 1),
                        HistoryItem(
                          icon: Icons.school,
                          nama: 'Print tugas',
                          jam: '10.45',
                          nominal: '-Rp3.000',
                        ),
                        Divider(height: 1),
                        HistoryItem(
                          icon: Icons.local_cafe,
                          nama: 'Es teh',
                          jam: '12.15',
                          nominal: '-Rp5.000',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// HALAMAN 2 - TAMBAH PENGELUARAN
class TambahPage extends StatelessWidget {
  const TambahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pengeluaran'),
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nominal',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const Row(
              children: [
                Text(
                  'Rp',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(hintText: '0'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Kategori',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                CategoryChip(
                  icon: Icons.restaurant,
                  label: 'Makan',
                  isSelected: true,
                ),
                CategoryChip(icon: Icons.two_wheeler, label: 'Transport'),
                CategoryChip(icon: Icons.school, label: 'Kuliah'),
                CategoryChip(icon: Icons.more_horiz, label: 'Lainnya'),
              ],
            ),
            const SizedBox(height: 24),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Catatan',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.pink,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// WIDGET BUATAN SENDIRI

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.pinkMuda,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: AppColors.pinkTua),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class HistoryItem extends StatelessWidget {
  final IconData icon;
  final String nama;
  final String jam;
  final String nominal;

  const HistoryItem({
    super.key,
    required this.icon,
    required this.nama,
    required this.jam,
    required this.nominal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.pink),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  jam,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(nominal, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const CategoryChip({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.pink : AppColors.pinkMuda,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? Colors.white : AppColors.pinkTua,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.pinkTua,
            ),
          ),
        ],
      ),
    );
  }
}
