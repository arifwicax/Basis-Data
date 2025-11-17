# Visualisasi Data
## Persiapan visualisasi
### 1. **Kenapa Menggunakan Python untuk Visualisasi Data**

Python menjadi *bahasa utama* dalam dunia *data science* dan *visualisasi data* karena alasan berikut:

### a. Banyak pustaka siap pakai

Python memiliki ekosistem pustaka yang sangat kaya, contohnya:

* **Matplotlib** → dasar untuk membuat grafik 2D (line, bar, scatter, dll.)
* **Seaborn** → membuat grafik statistik yang cantik dan informatif
* **Plotly** / **Bokeh** → grafik interaktif berbasis web
* **Geopandas**, **Folium**, **Kepler.gl**, **Cartopy** → untuk *visualisasi geospasial*
* **Dash** dan **Streamlit** → untuk membuat *dashboard interaktif* dengan cepat

Dengan Python, semua tahapan analisis data — dari *data cleaning*, *analysis*, hingga *visualisasi* — bisa dilakukan dalam satu ekosistem.

---

## 2. **Kenapa Menggunakan Miniconda (atau Anaconda)**

### Masalah umum tanpa conda:

Jika hanya menggunakan *Python standar* (misalnya dari python.org), Anda akan sering mengalami:

* Konflik versi pustaka (terutama `numpy`, `pandas`, `matplotlib`)
* Kesulitan menginstal pustaka yang butuh dependensi sistem (contohnya `geopandas` atau `rasterio`)
* Perbedaan versi Python antar proyek (misal proyek A pakai Python 3.9, proyek B pakai 3.12)

---

### Solusi dari Miniconda:

Miniconda adalah **versi ringan dari Anaconda** yang berfungsi sebagai *package manager* dan *environment manager*.

Kelebihannya:

#### ✅ a. **Isolasi lingkungan (environment)**

Setiap proyek bisa punya lingkungan Python sendiri:

```bash
conda create -n visualisasi python=3.12
conda activate visualisasi
```

Artinya, pustaka di proyek A tidak akan bentrok dengan pustaka proyek B.

#### b. **Instalasi pustaka lebih mudah**

Contoh:

```bash
conda install matplotlib seaborn geopandas
```

Conda akan otomatis menginstal semua *dependency* (termasuk library sistem) tanpa error “failed to build wheel”.

#### c. **Kompatibilitas lintas platform**

Baik Windows, Linux, maupun macOS bisa menjalankan environment yang sama.

#### d. **Integrasi dengan Jupyter Notebook**

Miniconda mempermudah setup Jupyter untuk eksplorasi data interaktif.

---

## 3. **Kombinasi Ideal: Miniconda + Python**

Keduanya saling melengkapi:

| Aspek                                     | Python          | Miniconda                              |
| ----------------------------------------- | --------------- | -------------------------------------- |
| Bahasa pemrograman                        | ✅ Ya            | ❌ Tidak                                |
| Manajemen paket                           | Sebagian (pip)  | ✅ Lengkap (conda)                      |
| Isolasi environment                       | Terbatas (venv) | ✅ Sempurna                             |
| Kemudahan install pustaka berat (GIS, ML) | ❌ Sering gagal  | ✅ Aman                                 |
| Ukuran instalasi                          | Kecil           | Sedang (tapi versi “Miniconda” ringan) |

---

# **Materi: Visualisasi Data Interaktif Menggunakan Streamlit**

## **1. Pendahuluan**

### Apa itu Streamlit?

**Streamlit** adalah framework berbasis Python yang digunakan untuk membuat **aplikasi web interaktif** secara **cepat dan sederhana**, tanpa perlu menggunakan HTML, CSS, atau JavaScript.

Streamlit sangat populer di bidang:

* 📊 **Data Science**
* 🌍 **Analisis Geospasial**
* 🧠 **Machine Learning**
* 💚 **Visualisasi CSR dan Lingkungan**

> Dengan Streamlit, skrip Python biasa dapat langsung berubah menjadi *dashboard interaktif* hanya dengan beberapa baris kode.

---

## **2. Instalasi dan Persiapan Lingkungan**

### a. Buat environment baru (disarankan menggunakan Miniconda)

```bash
conda create -n streamlit-env python=3.12
conda activate streamlit-env
```

### b. Instal pustaka Streamlit dan pendukungnya

```bash
pip install streamlit pandas matplotlib seaborn plotly
```

### c. Verifikasi instalasi

```bash
streamlit hello
```

Perintah ini akan membuka **demo resmi Streamlit** di browser.

---

## **3. Struktur Dasar Program Streamlit**

Struktur file Streamlit biasanya sangat sederhana, misalnya:

```
project/
└── app.py
```

Isi file `app.py`:

```python
import streamlit as st

st.title("Aplikasi Visualisasi Data Tanamin 🌱")
st.write("Selamat datang di aplikasi visualisasi data lingkungan!")
```

Jalankan dengan:

```bash
streamlit run app.py
```

Browser akan terbuka otomatis di `http://localhost:8501`.

---

## **4. Membuat Visualisasi Data Dasar**

### Contoh DataFrame

```python
import pandas as pd

data = pd.DataFrame({
    "Kampanye": ["Mangrove Balikpapan", "Pantai Samboja", "Delta Mahakam"],
    "Total Donasi (juta)": [120, 85, 60]
})

st.subheader("📈 Data Donasi Kampanye Lingkungan")
st.dataframe(data)
```

---

### a. Visualisasi dengan Bar Chart

```python
st.bar_chart(data.set_index("Kampanye"))
```

### b. Visualisasi dengan Line Chart

```python
st.line_chart(data.set_index("Kampanye"))
```

### c. Visualisasi dengan Matplotlib

```python
import matplotlib.pyplot as plt

fig, ax = plt.subplots()
ax.bar(data["Kampanye"], data["Total Donasi (juta)"], color="green")
ax.set_ylabel("Donasi (juta)")
st.pyplot(fig)
```

---

## **5. Menambahkan Interaktivitas**

### a. Dropdown (selectbox)

```python
tipe = st.selectbox("Pilih jenis grafik:", ["Bar", "Pie"])

if tipe == "Bar":
    st.bar_chart(data.set_index("Kampanye"))
else:
    fig, ax = plt.subplots()
    ax.pie(data["Total Donasi (juta)"], labels=data["Kampanye"], autopct="%1.1f%%")
    st.pyplot(fig)
```

### b. Slider

```python
nilai = st.slider("Tampilkan data hingga donasi minimum:", 0, 150, 50)
st.dataframe(data[data["Total Donasi (juta)"] >= nilai])
```

---

## **6. Visualisasi Geospasial dengan Streamlit**

Jika Bapak ingin menampilkan peta sebaran mangrove:

```python
import geopandas as gpd
import streamlit as st

st.title("Sebaran Lokasi Penanaman Mangrove 🌿")

# Contoh titik lokasi (latitude, longitude)
data_peta = pd.DataFrame({
    'lokasi': ['Balikpapan', 'Samboja', 'Mahakam'],
    'lat': [-1.27, -1.10, -0.50],
    'lon': [116.83, 117.00, 117.25]
})

st.map(data_peta)
```

---

## **7. Membuat Dashboard Sederhana**

Contoh dashboard lengkap:

```python
import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

st.title("Dashboard Donasi Lingkungan 🌱")

# Data
data = pd.DataFrame({
    "Kampanye": ["Mangrove Balikpapan", "Pantai Samboja", "Delta Mahakam"],
    "Donasi": [120, 85, 60],
    "Target": [150, 100, 90]
})

# Pilihan kampanye
kampanye = st.selectbox("Pilih kampanye:", data["Kampanye"])

# Filter data
row = data[data["Kampanye"] == kampanye].iloc[0]

st.metric("Donasi Saat Ini", f"{row['Donasi']} juta", delta=row['Donasi']-row['Target'])
st.progress(row['Donasi'] / row['Target'])

# Grafik
fig, ax = plt.subplots()
ax.bar(data["Kampanye"], data["Donasi"], color="green")
ax.set_ylabel("Donasi (juta)")
st.pyplot(fig)
```

---

## **8. Menambahkan Gambar dan Teks Deskriptif**

```python
st.image("mangrove.jpg", caption="Kegiatan Penanaman Mangrove di Balikpapan")
st.markdown("""
### Tujuan Program
Meningkatkan kesadaran masyarakat terhadap pentingnya ekosistem mangrove.
""")
```

---

## **9. Deploy Aplikasi ke Cloud (Opsional)**

Streamlit menyediakan platform gratis:
👉 [https://share.streamlit.io](https://share.streamlit.io)

Langkah singkat:

1. Buat repository di GitHub.
2. Upload file `app.py` dan `requirements.txt`.
3. Login ke Streamlit Cloud.
4. Pilih “New App” → Hubungkan ke repository GitHub.
5. Jalankan aplikasi langsung dari browser.

---

## **10. Kesimpulan**

| Keunggulan    | Keterangan                                          |
| ------------- | --------------------------------------------------- |
| 🚀 Cepat      | Dari Python ke web hanya dalam hitungan menit       |
| 🧠 Mudah      | Tidak perlu tahu HTML/CSS                           |
| 📊 Kuat       | Dukungan penuh untuk Matplotlib, Plotly, Seaborn    |
| 🌍 Interaktif | Cocok untuk visualisasi CSR, donasi, dan lingkungan |
| 🧩 Fleksibel  | Bisa dikombinasikan dengan data real-time dan peta  |

---


# **Materi Dasar Pemrograman Python (Basic Python)**

## **Tujuan Pembelajaran**

Setelah mempelajari materi ini, mahasiswa diharapkan mampu:

1. Memahami konsep dasar Python sebagai bahasa pemrograman.
2. Menggunakan tipe data, variabel, dan operator.
3. Menulis struktur kontrol seperti percabangan dan perulangan.
4. Membuat fungsi sederhana.
5. Mengelola data menggunakan list, tuple, dictionary.
6. Melakukan input/output dan memahami struktur file Python.

---

## **1. Pengenalan Python**

### Apa itu Python?

Python adalah bahasa pemrograman tingkat tinggi yang:

* Mudah dibaca dan ditulis.
* Bersifat open-source dan multiplatform.
* Banyak digunakan untuk **web development**, **data science**, **AI**, **automasi**, dan **visualisasi data**.

### Keunggulan Python

✅ Sintaks sederhana seperti bahasa manusia.
✅ Komunitas besar dan pustaka lengkap (misal: NumPy, Pandas, Matplotlib).
✅ Cocok untuk pemula dan profesional.

### Menjalankan Python

Ada beberapa cara:

* **Interpreter langsung (terminal):**

  ```bash
  python
  ```
* **File Python:**

  ```bash
  python nama_file.py
  ```
* **Jupyter Notebook** (untuk data science):

  ```bash
  jupyter notebook
  ```

---

## **2. Variabel dan Tipe Data**

### Variabel

Variabel digunakan untuk menyimpan data.

```python
nama = "Arif"
umur = 25
tinggi = 170.5
aktif = True

print(nama, umur, tinggi, aktif)
```

### Tipe Data Dasar

| Tipe Data | Contoh          | Keterangan         |
| --------- | --------------- | ------------------ |
| `int`     | `10`, `-5`      | Bilangan bulat     |
| `float`   | `3.14`, `2.5`   | Bilangan desimal   |
| `str`     | `"Tanamin"`     | Teks / string      |
| `bool`    | `True`, `False` | Logika benar/salah |

---
## **3. Operator Dasar**

### Operator Aritmatika

```python
a, b = 10, 3
print(a + b)  # Penjumlahan
print(a - b)  # Pengurangan
print(a * b)  # Perkalian
print(a / b)  # Pembagian (hasil float)
print(a // b) # Pembagian (bulat)
print(a % b)  # Sisa bagi
print(a ** b) # Pangkat
```

### Operator Perbandingan

```python
print(a == b)
print(a != b)
print(a > b)
print(a < b)
```

### Operator Logika

```python
x, y = True, False
print(x and y)
print(x or y)
print(not x)
```

---

## **4. Struktur Kontrol**

### a. **Percabangan (if, elif, else)**

```python
nilai = 85

if nilai >= 90:
    print("A")
elif nilai >= 75:
    print("B")
else:
    print("C")
```

### b. **Perulangan (for)**

```python
for i in range(5):
    print("Perulangan ke-", i)
```

### c. **Perulangan (while)**

```python
count = 0
while count < 3:
    print("Iterasi", count)
    count += 1
```

---

## **5. Struktur Data (List, Tuple, Dictionary)**

### a. **List (daftar data)**

```python
buah = ["mangga", "apel", "pisang"]
print(buah[0])        # Akses elemen
buah.append("jeruk")  # Tambah elemen
print(buah)
```

### b. **Tuple (data tetap / tidak bisa diubah)**

```python
warna = ("merah", "hijau", "biru")
print(warna[1])
```

### c. **Dictionary (data pasangan kunci-nilai)**

```python
donatur = {"nama": "Andi", "jumlah": 500000, "kota": "Balikpapan"}
print(donatur["nama"])
donatur["status"] = "aktif"
print(donatur)
```

---

## **6. Fungsi (Function)**

### a. Fungsi Dasar

```python
def sapa(nama):
    print(f"Halo {nama}, selamat datang!")

sapa("Arif")
```

### b. Fungsi dengan Nilai Kembali

```python
def luas_persegi(sisi):
    return sisi * sisi

hasil = luas_persegi(4)
print("Luas:", hasil)
```

---

## **7. Input dan Output**

### Input dari pengguna

```python
nama = input("Masukkan nama: ")
print("Halo,", nama)
```

### Format Output

```python
umur = 25
print(f"Nama saya {nama}, umur {umur} tahun.")
```

---

## **8. Membaca dan Menulis File**

### Menulis file

```python
with open("data.txt", "w") as f:
    f.write("Data donasi mangrove\n")
```

### Membaca file

```python
with open("data.txt", "r") as f:
    print(f.read())
```

---

## 🧠 **9. Contoh Kasus Mini: Data Donasi**

```python
donasi = [
    {"nama": "Andi", "jumlah": 500000},
    {"nama": "Siti", "jumlah": 750000},
    {"nama": "Budi", "jumlah": 300000}
]

total = 0
for d in donasi:
    total += d["jumlah"]

print("Total Donasi:", total)
```

Output:

```
Total Donasi: 1550000
```

---

## 🧩 **10. Latihan Mahasiswa**

1. Buat program untuk menghitung **luas dan keliling persegi panjang** berdasarkan input pengguna.
2. Buat program untuk menampilkan **angka ganjil dari 1–100** menggunakan perulangan.
3. Buat daftar `donasi = [100000, 250000, 150000]`, lalu tampilkan total dan rata-rata donasi.
4. Buat fungsi yang menampilkan apakah suatu angka adalah **bilangan prima** atau bukan.
5. Simpan hasil latihan dalam file Python `.py` dan jalankan di terminal.

---

## 📚 **11. Kesimpulan**

| Konsep               | Keterangan                              |
| -------------------- | --------------------------------------- |
| Variabel & Tipe Data | Menyimpan nilai dan informasi           |
| Operator             | Melakukan operasi logika dan matematika |
| Percabangan          | Mengambil keputusan berdasarkan kondisi |
| Perulangan           | Melakukan tindakan berulang             |
| Fungsi               | Membuat kode lebih rapi dan reusable    |
| Struktur Data        | Mengelola data secara efisien           |

---

Berikut versi parafrase dari materi yang Bapak berikan, disusun lebih ringkas, jelas, dan tetap lengkap untuk **pengantar Python / proyek akhir administrasi basis data**:

---

# **3. Operator Dasar Python**

### **Operator Aritmatika**

Digunakan untuk operasi matematika dasar:

```python
a, b = 10, 3
print(a + b)  # Penjumlahan
print(a - b)  # Pengurangan
print(a * b)  # Perkalian
print(a / b)  # Pembagian (hasil float)
print(a // b) # Pembagian bulat
print(a % b)  # Sisa bagi
print(a ** b) # Pangkat
```

### **Operator Perbandingan**

Membandingkan nilai:

```python
print(a == b)  # Sama dengan
print(a != b)  # Tidak sama dengan
print(a > b)   # Lebih besar
print(a < b)   # Lebih kecil
```

### **Operator Logika**

Untuk operasi logika True/False:

```python
x, y = True, False
print(x and y)  # AND
print(x or y)   # OR
print(not x)    # NOT
```

---

# **4. Struktur Kontrol**

### **a. Percabangan (if, elif, else)**

```python
nilai = 85

if nilai >= 90:
    print("A")
elif nilai >= 75:
    print("B")
else:
    print("C")
```

### **b. Perulangan (for)**

```python
for i in range(5):
    print("Perulangan ke-", i)
```

### **c. Perulangan (while)**

```python
count = 0
while count < 3:
    print("Iterasi", count)
    count += 1
```

---

# **5. Struktur Data**

### **a. List (daftar yang bisa diubah)**

```python
buah = ["mangga", "apel", "pisang"]
print(buah[0])        # Akses elemen
buah.append("jeruk")  # Menambahkan elemen
print(buah)
```

### **b. Tuple (data tetap / immutable)**

```python
warna = ("merah", "hijau", "biru")
print(warna[1])
```

### **c. Dictionary (pasangan kunci-nilai)**

```python
donatur = {"nama": "Andi", "jumlah": 500000, "kota": "Balikpapan"}
print(donatur["nama"])
donatur["status"] = "aktif"
print(donatur)
```

---

# **6. Fungsi (Function)**

### **a. Fungsi sederhana**

```python
def sapa(nama):
    print(f"Halo {nama}, selamat datang!")

sapa("Arif")
```

### **b. Fungsi dengan nilai kembali (return)**

```python
def luas_persegi(sisi):
    return sisi * sisi

hasil = luas_persegi(4)
print("Luas:", hasil)
```

---

# **7. Input dan Output**

### **Input pengguna**

```python
nama = input("Masukkan nama: ")
print("Halo,", nama)
```

### **Format output dengan f-string**

```python
umur = 25
print(f"Nama saya {nama}, umur {umur} tahun.")
```

---

# **8. Membaca dan Menulis File**

### **Menulis ke file**

```python
with open("data.txt", "w") as f:
    f.write("Data donasi mangrove\n")
```

### **Membaca file**

```python
with open("data.txt", "r") as f:
    print(f.read())
```

---

# **9. Contoh Kasus Mini: Total Donasi**

```python
donasi = [
    {"nama": "Andi", "jumlah": 500000},
    {"nama": "Siti", "jumlah": 750000},
    {"nama": "Budi", "jumlah": 300000}
]

total = sum(d["jumlah"] for d in donasi)
print("Total Donasi:", total)
```

**Output:**

```
Total Donasi: 1550000
```

---

# **10. Latihan Praktik Mahasiswa**

1. Buat program menghitung **luas dan keliling persegi panjang** dari input pengguna.
2. Tampilkan **angka ganjil dari 1–100** menggunakan perulangan.
3. Buat daftar `donasi = [100000, 250000, 150000]` dan hitung total serta rata-rata.
4. Buat fungsi untuk mengecek apakah suatu angka adalah **bilangan prima**.
5. Simpan semua latihan dalam file `.py` dan jalankan melalui terminal.

---

# **11. Kesimpulan**

| Konsep               | Keterangan                              |
| -------------------- | --------------------------------------- |jual
| Variabel & Tipe Data | Menyimpan nilai dan informasi           |
| Operator             | Melakukan operasi matematika dan logika |
| Percabangan          | Mengambil keputusan berdasarkan kondisi |
| Perulangan           | Menjalankan kode berulang               |
| Fungsi               | Membuat kode lebih rapi dan reusable    |
| Struktur Data        | Mengelola data secara efisien           |

---
