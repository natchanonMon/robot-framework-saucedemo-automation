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

- เพิ่ม Backpack และ Bike Light ลงตะกร้าได้
- เพิ่ม Backpack ลงตะกร้าได้
- ใช้ Test Setup สำหรับเตรียม Login ก่อนเริ่มทดสอบ
- ใช้ Test Teardown สำหรับ cleanup และปิด Browser

### การทดสอบเพิ่มสินค้า End-to-End
- เพิ่มสินค้าและตรวจสอบ Cart
- กรอกข้อมูล Checkout
- ตรวจสอบสินค้าและจำนวนใน Order Overview
- ตรวจสอบ Payment และ Shipping information
- ตรวจสอบว่า Item total + Tax = Total
- ยืนยันคำสั่งซื้อ
- ตรวจสอบข้อความ Thank you for your order!

## CI/CD with GitHub Actions

โปรเจกต์นี้ใช้ GitHub Actions สำหรับรัน Robot Framework tests อัตโนมัติทุกครั้งที่มีการ push code ขึ้น GitHub

Workflow จะทำขั้นตอนดังนี้:

- Checkout source code
- Setup Python
- Install dependencies จาก `requirements.txt`
- Run Robot Framework tests แบบ Headless Chrome
- Upload test results เป็น Artifact


## เครื่องมือที่ใช้

- Python
- Robot Framework
- SeleniumLibrary
- Selenium
- Google Chrome

## โครงสร้างโปรเจกต์

```text
.
├── cart_add_products_success.robot
├── checkout_e2e_success.robot
├── cart.resource
├── login_positive_multiple_users_success.robot
├── login_validation.robot
├── requirements.txt
├── .gitignore
└── README.md
```

## สิ่งที่ต้องมี

- Python 3.14.6
- Google Chrome
- Robot Framework 7.4.2
- SeleniumLibrary
- Selenium

ติดตั้ง library ที่จำเป็น:

```bash
pip install -r requirements.txt
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
robot -d results cart_add_products_success.robot
```
รันเฉพาะ Cart Test e2e:

```bash
robot -d results checkout_e2e_success.robot
```

รันเฉพาะเคส Tags Smoke:

```bash
robot -i smoke -d results/smoke --name "SauceDemo Smoke Tests" .
```

รันเฉพาะเคส Tags regression:
```bash
robot -i regression -d results/regression --name "SauceDemo Regression Tests" .
```

รันบน CI
```bash
robot -v BROWSER:headlesschrome -d results .
```

ผลการรันจะถูกสร้างไว้ในโฟลเดอร์ `results`