*** Settings ***
Library    SeleniumLibrary
Resource    cart.resource
Test Setup       เปิดเว็บและเข้าสู่ระบบ
Test Teardown    ทำความสะอาดหลังจบการทดสอบ


*** Test Cases ***
Login เป็น Precondition เพื่อให้เข้าถึงสินค้าและตระกร้าสินค้าจากนั้นทดสอบว่าสามารถเพิ่ม Backpack และ Bike Light อย่างละ 1 ชิ้นและตระกร้าสินค้าแสดงสินค้ากับจำนวนได้ตามที่เพิ่มไหม
    กดปุ่ม Add to cart ของสินค้า    Sauce Labs Backpack
    กดปุ่ม Add to cart ของสินค้า    Sauce Labs Bike Light
    ตรวจสอบจำนวนสินค้าที่เพิ่มในตะกร้า    2
    เข้าหน้าตะกร้าสินค้า
    ตรวจสอบว่าจำนวนสินค้า    Sauce Labs Backpack    1
    ตรวจสอบว่าจำนวนสินค้า    Sauce Labs Bike Light    1
    ตรวจสอบว่าสินค้าอยู่ในตระกร้า    Sauce Labs Backpack
    ตรวจสอบว่าสินค้าอยู่ในตระกร้า     Sauce Labs Bike Light

เพิ่ม Backpack 1 ชิ้นแล้วตะกร้าแสดงถูกต้อง
    กดปุ่ม Add to cart ของสินค้า    Sauce Labs Backpack
    ตรวจสอบจำนวนสินค้าที่เพิ่มในตะกร้า    1
    เข้าหน้าตะกร้าสินค้า
    ตรวจสอบว่าจำนวนสินค้า    Sauce Labs Backpack    1
    ตรวจสอบว่าสินค้าอยู่ในตระกร้า    Sauce Labs Backpack