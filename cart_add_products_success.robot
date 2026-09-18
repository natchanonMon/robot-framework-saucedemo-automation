*** Settings ***
Library    SeleniumLibrary
Resource    cart.resource
Test Setup       เปิดเว็บและเข้าสู่ระบบ
Test Teardown    ทำความสะอาดหลังจบการทดสอบ


*** Test Cases ***
เพิ่ม Backpack และ Bike Light ลงตะกร้าได้
    [Tags]    smoke    regression
    กดปุ่ม Add to cart ของสินค้า    Sauce Labs Backpack
    กดปุ่ม Add to cart ของสินค้า    Sauce Labs Bike Light
    ตรวจสอบจำนวนสินค้าที่เพิ่มในตะกร้า    2
    เข้าหน้าตะกร้าสินค้า
    ตรวจสอบว่าจำนวนสินค้า    Sauce Labs Backpack    1
    ตรวจสอบว่าจำนวนสินค้า    Sauce Labs Bike Light    1
    ตรวจสอบว่าสินค้าอยู่ในตระกร้า    Sauce Labs Backpack
    ตรวจสอบว่าสินค้าอยู่ในตระกร้า     Sauce Labs Bike Light

เพิ่ม Backpack ลงตะกร้าได้
    [Tags]    smoke    regression
    กดปุ่ม Add to cart ของสินค้า    Sauce Labs Backpack
    ตรวจสอบจำนวนสินค้าที่เพิ่มในตะกร้า    1
    เข้าหน้าตะกร้าสินค้า
    ตรวจสอบว่าจำนวนสินค้า    Sauce Labs Backpack    1
    ตรวจสอบว่าสินค้าอยู่ในตระกร้า    Sauce Labs Backpack