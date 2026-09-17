# Import library
import streamlit as st
import pandas as pd
from datetime import datetime

# Import fungsi dari config.py
from config import *

# Set konfigurasi halaman dashboard
st.set_page_config("Dashboard", page_icon="", layout="wide")  # Judul, ikon, tata letak lebar

# Ambil data pelanggan
result_customers = view_customers()

# Buat DataFrame pelanggan
df_customers = pd.DataFrame(result_customers, columns=[
    "customer_id", "name", "email", "phone", "address", "birthdate"
])

# Hitung usia dari birthdate
df_customers['birthdate'] = pd.to_datetime(df_customers['birthdate']) #merubah tipe string menjadi datetime
df_customers['Age'] = (datetime.now() - df_customers['birthdate']).dt.days // 365 # waktu sekarang - dt.days : mengambil jumlah harinya saja dari selisih tersebut / 365.

# Fungsi tampilkan tabel + export CSV
def tabelCustomers_dan_export():
    # Hitung jumlah pelanggan
    total_customers = df_customers.shape[0]

    # Tampilkan metrik
    col1, col2, col3 = st.columns(3) # Fungsi st.columns(3) membuat tiga kolom sejajar di tampilan web Streamlit, menjadi tiga bagian horizontal — col1, col2, dan col3.
    with col1:
        st.metric(label="📦 Total Pelanggan", value=total_customers, delta="Semua Data")

    #Sidebar: Filter Rentang Usia
    st.sidebar.header("FilterWhere Rentang Usia") # akan muncul area kiri sidebar
    min_age = int(df_customers['Age'].min()) # min : mengambil kolom berisi umur termuda, int : dalam bentuk bilangan bulat
    max_age = int(df_customers['Age'].max()) # maz : mengambil kolom berisi umur tertua, int : dalam bentuk bilangan bulat
    age_range = st.sidebar.slider( # membuat slider (penggeser) di sidebar untuk memilih rentang usia.
        "Pilih Rentang Usia",
        min_value=min_age, # Nilai minimum umur
        max_value=max_age, # nilai maxsimum umur
        value=(min_age, max_age) # Nilai awal slider, misal (19, 40)
    )

    #Terapkan filter usia
    filtered_df = df_customers[df_customers['Age'].between(*age_range)]

    # Tampilkan tabel pelanggan
    st.markdown("### 📋 Tabel Data Pelanggan")
    
    showdata = st.multiselect( # menampilkan daftar kolom dari filtered_df yang bisa dipilih pengguna.
        "Pilih Kolom Pelanggan yang Ditampilkan",
        options=filtered_df.columns, # menampilkan semua nama kolom yang tersedia.
        default=["customer_id", "name", "email", "phone", "address", "birthdate", "Age"]
    )
    
    # Menampilkan tabel data pelanggan ke layar dengan hanya kolom yang dipilih (showdata).
    # use_container_width=True membuat tabel otomatis menyesuaikan lebar layar (responsif).
    st.dataframe(filtered_df[showdata], use_container_width=True) 

    # Mendefinisikan fungsi helper untuk mengubah DataFrame menjadi file CSV.
    # @st.cache_data adalah decorator Streamlit agar fungsi ini tidak dijalankan ulang setiap kali halaman di-refresh
    # _df.to_csv(index=False) mengubah DataFrame menjadi teks CSV tanpa kolom indeks.
    # membuat hasilnya bisa diunduh dengan karakter yang benar

    @st.cache_data
    def convert_df_to_csv(_df):
        return _df.to_csv(index=False).encode('utf-8')
    
    csv = convert_df_to_csv(filtered_df[showdata])
    st.download_button(
        label="⬇️ Download Data Pelanggan sebagai CSV",
        data=csv,
        file_name='data_pelanggan.csv',
        mime='text/csv'
    )

# Sidebar untuk memilih tampilan
st.sidebar.success("Pilih Tabel:")
if st.sidebar.checkbox("Tampilkan Pelanggan"):
    tabelCustomers_dan_export()
