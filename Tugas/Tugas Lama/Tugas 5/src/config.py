# mysql_config.py
import mysql.connector

# Koneksi ke database
conn = mysql.connector.connect(
    host="localhost",
    port="8889",
    user="root",
    password="root",
    database="sales_db"
)

# Membuat cursor
c = conn.cursor()

# Fungsi ambil data dari tiap tabel
def view_customers():
    c.execute('SELECT * FROM customers ORDER BY name ASC')
    return c.fetchall()

def view_orders_with_customers():
    c.execute('''
        SELECT 
            o.order_id, 
            o.order_date, 
            o.total_amount, 
            c.name AS customer_name, 
            c.phone 
        FROM 
            orders o 
        JOIN 
            customers c ON o.customer_id = c.customer_id 
        ORDER BY 
            o.order_date DESC
    ''')
    return c.fetchall()

def view_products():
    c.execute('SELECT * FROM products ORDER BY name ASC')
    return c.fetchall()

def view_order_details_with_info():
    c.execute('''
        SELECT 
            od.order_detail_id,
            o.order_id,
            o.order_date,
            c.customer_id,
            c.name AS customer_name,
            p.product_id,
            p.name AS product_name,
            p.price AS unit_price,
            od.quantity,
            od.subtotal,
            o.total_amount AS order_total,
            c.phone
        FROM 
            order_details od
        JOIN 
            orders o ON od.order_id = o.order_id
        JOIN 
            customers c ON o.customer_id = c.customer_id
        JOIN 
            products p ON od.product_id = p.product_id
        ORDER BY 
            o.order_date DESC
    ''')
    return c.fetchall()