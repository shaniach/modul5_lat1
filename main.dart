import 'dart:convert';

void main() {
  // JSON transkrip mahasiswa
  String transkripJson = '''
  {
    "nama": "Shania Chairunnisa Santoso",
    "npm": "22082010062",
    "program_studi": "Sistem Informasi",
    "jumlah_semester": 3,
    "transkrip": [
      {
        "semester": 1,
        "mata_kuliah": [
          {
            "kode": "SI211102",
            "nama": "Pengantar Sistem Informasi",
            "sks": 3,
            "nilai": "A"
          },
          {
            "kode": "SI211103",
            "nama": "Logika dan Algoritma",
            "sks": 3,
            "nilai": "A-"
          },
          {
            "kode": "SI2111104",
            "nama": "Bahasa Pemrograman 1",
            "sks": 3,
            "nilai": "B+"
          },
          {
            "kode": "SI2111105",
            "nama": "Pengetahuan Bisnis",
            "sks": 3,
            "nilai": "A"
          }
        ]
      },
      {
        "semester": 2,
        "mata_kuliah": [
          {
            "kode": "SI211107",
            "nama": "Basis Data",
            "sks": 3,
            "nilai": "A-"
          },
          {
            "kode": "SI211112",
            "nama": "Sistem Informasi Manajemen",
            "sks": 3,
            "nilai": "B"
          },
          {
            "kode": "SI211108",
            "nama": "Analisis Proses Bisnis",
            "sks": 3,
            "nilai": "A"
          },
          {
            "kode": "SI211108",
            "nama": "Bahasa Pemrograman 2",
            "sks": 3,
            "nilai": "B+"
          }
        ]
      },
      {
        "semester": 3,
        "mata_kuliah": [
          {
            "kode": "SI231114",
            "nama": "Pemrograman Desktop",
            "sks": 3,
            "nilai": "A"
          },
          {
            "kode": "SI231139",
            "nama": "Analisis Desain Sistem Informasi",
            "sks": 3,
            "nilai": "A-"
          },
          {
            "kode": "SI231110",
            "nama": "Desain Manajemen Jaringan",
            "sks": 3,
            "nilai": "A"
          },
          {
            "kode": "SI231115",
            "nama": "Administrasi Basis Data",
            "sks": 3,
            "nilai": "B"
          }
        ]
      }
    ]
  }
  ''';

  Map<String, dynamic> transkrip = jsonDecode(transkripJson);

  print('Transkrip Nilai Mahasiswa:');
  print('Nama: ${transkrip['nama']}');
  print('NPM: ${transkrip['npm']}');
  print('Program Studi: ${transkrip['program_studi']}');
  print('Jumlah Semester: ${transkrip['jumlah_semester']}');

  double ipk = hitungIPK(transkrip['transkrip']);

  print('IPK: ${ipk.toStringAsFixed(2)}');
}

double hitungIPK(List<dynamic> transkrip) {
  double totalBobot = 0;
  int totalSKS = 0;

  for (var semester in transkrip) {
    for (var matkul in semester['mata_kuliah']) {
      double bobot = konversiNilaiKeBobot(matkul['nilai']);
      int sks = matkul['sks'];

      totalBobot += bobot * sks;
      totalSKS += sks;
    }
  }

  double ipk = totalBobot / totalSKS;
  return ipk;
}

double konversiNilaiKeBobot(String nilai) {
  switch (nilai) {
    case 'A':
      return 4.0;
    case 'A-':
      return 3.75;
    case 'B':
      return 3.3;
    case 'B+':
      return 3.5;
    default:
      return 0.0;
  }
}
