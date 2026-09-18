*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    cart.resource
Resource    login.resource
Resource    checkout.resource
Test Setup       เปิดเว็บและเข้าสู่ระบบ
Test Teardown    Close Browser

*** Test Cases ***
สั่งซื้อ Backpack และ Bike Light สำเร็จ
    [Tags]    smoke    regression
    กดปุ่ม Add to cart ของสินค้า    Sauce Labs Backpack
    กดปุ่ม Add to cart ของสินค้า    Sauce Labs Bike Light
    ตรวจสอบจำนวนสินค้าที่เพิ่มในตะกร้า    2
    เข้าหน้าตะกร้าสินค้า
    ตรวจสอบว่าจำนวนสินค้า    Sauce Labs Backpack    1
    ตรวจสอบว่าจำนวนสินค้า    Sauce Labs Bike Light    1
    ตรวจสอบว่าสินค้าอยู่ในตระกร้า    Sauce Labs Backpack
    ตรวจสอบว่าสินค้าอยู่ในตระกร้า     Sauce Labs Bike Light
    กดปุ่มชำระเงิน
    ใส่ข้อมูลที่อยู่จัดส่งสินค้า    Test    User    11000
    กดปุ่ม Continue
    ตรวจสอบผลรวมของราคาสินค้ากับยอดภาษี
    ตรวจสอบสินค้าที่สั่งว่ายังอยู่ในหน้าคำนวณราคา    Sauce Labs Backpack    1
    ตรวจสอบสินค้าที่สั่งว่ายังอยู่ในหน้าคำนวณราคา    Sauce Labs Bike Light    1
    กดปุ่ม Finish
    ตรวจสอบว่าต้องพบหน้าขอบคุณการสั่งซื้อสินค้า

สั่งซื้อ Backpack 1 ชิ้นสำเร็จ
    [Tags]    smoke    regression
    กดปุ่ม Add to cart ของสินค้า    Sauce Labs Backpack
    ตรวจสอบจำนวนสินค้าที่เพิ่มในตะกร้า    1
    เข้าหน้าตะกร้าสินค้า
    ตรวจสอบว่าจำนวนสินค้า    Sauce Labs Backpack    1
    ตรวจสอบว่าสินค้าอยู่ในตระกร้า    Sauce Labs Backpack
    กดปุ่มชำระเงิน
    ใส่ข้อมูลที่อยู่จัดส่งสินค้า    Test    User    11000
    กดปุ่ม Continue
    ตรวจสอบผลรวมของราคาสินค้ากับยอดภาษี
    ตรวจสอบสินค้าที่สั่งว่ายังอยู่ในหน้าคำนวณราคา    Sauce Labs Backpack    1
    กดปุ่ม Finish
    ตรวจสอบว่าต้องพบหน้าขอบคุณการสั่งซื้อสินค้า