# SauceDemo UI Test Automation

โปรเจกต์ Automation Test สำหรับเว็บไซต์ [SauceDemo](https://www.saucedemo.com/) พัฒนาด้วย Robot Framework และ SeleniumLibrary

## ขอบเขตการทดสอบ

### การตรวจสอบการ Login

- Login ด้วย password ผิด
- Login ด้วย username ผิด
- Login โดยไม่กรอก username
- Login โดยไม่กรอก password
- ตรวจสอบข้อความ error ที่ระบบแสดง
- ตรวจสอบว่า Login ไม่สำเร็จจะไม่เข้าสู่หน้า Products

กรณี Negative Login ใช้ Robot Framework Test Template เพื่อทำ Data-driven Testing และลด code ซ้ำ

### การ Login สำเร็จ

- ตรวจสอบการ Login สำเร็จด้วยหลายบัญชีของ SauceDemo
- ตรวจสอบว่าเข้าสู่หน้า Products สำเร็จ
- Logout หลังจาก Login สำเร็จในแต่ละรอบ

### การทดสอบตะกร้าสินค้า

- เพิ่มสินค้า 1 ชิ้น และตรวจสอบ Cart badge, จำนวนสินค้า และชื่อสินค้า
- เพิ่มสินค้า 2 ชิ้น และตรวจสอบ Cart badge, จำนวนสินค้า และชื่อสินค้า
- ใช้ Test Setup สำหรับเตรียม Login ก่อนเริ่มทดสอบ
- ใช้ Test Teardown สำหรับ cleanup และปิด Browser

## เครื่องมือที่ใช้

- Python
- Robot Framework
- SeleniumLibrary
- Selenium
- Google Chrome

## โครงสร้างโปรเจกต์

```text
.
├── cart_add_products.robot
├── cart.resource
├── login_positive_multiple_users.robot
└── login_validation.robot
```

## สิ่งที่ต้องมี

- Python 3.14.6
- Google Chrome
- Robot Framework 7.4.2
- SeleniumLibrary
- Selenium

ติดตั้ง library ที่จำเป็น:

```bash
pip install robotframework==7.4.2 robotframework-seleniumlibrary==6.9.0 selenium==4.45.0
```

## วิธีรัน Test

รันทั้งหมด:

```bash
robot -d results .
```

รันเฉพาะ Login Validation:

```bash
robot -d results login_validation.robot
```

รันเฉพาะ Cart Test:

```bash
robot -d results cart_add_products.robot
```

ผลการรันจะถูกสร้างไว้ในโฟลเดอร์ `results`