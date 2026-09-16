*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce


*** Keywords ***
เปิดเว็บและเข้าสู่ระบบ
    Open Browser    url=${URL}    browser=${BROWSER}    options=add_experimental_option("prefs", {"profile.password_manager_leak_detection": False})
    Maximize Browser Window
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login-button
    Wait Until Element Is Visible    id:inventory_container

กดปุ่ม Add to cart ของสินค้า
    [Arguments]    ${additem_name}
    Click Button    xpath://*[text()="${additem_name}"]/ancestor::div[@data-test='inventory-item-description']//button[contains(@class,'btn_inventory')]
    
ตรวจสอบจำนวนสินค้าที่เพิ่มในตะกร้า
    [Arguments]    ${expected_quantity}
    Wait Until Element Is Visible    class:shopping_cart_badge
    Element Text Should Be    class:shopping_cart_badge    ${expected_quantity}

เข้าหน้าตะกร้าสินค้า
    Click link    class:shopping_cart_link

ตรวจสอบว่าจำนวนสินค้า
    [Arguments]    ${item_name}    ${quantityproduct}
    Wait Until Element Is Visible    xpath://*[text()="${item_name}"]/ancestor::div[@data-test='inventory-item']//div[@data-test='item-quantity']
    Element Text Should Be    xpath://*[text()="${item_name}"]/ancestor::div[@data-test='inventory-item']//div[@data-test='item-quantity']    ${quantityproduct}

ตรวจสอบว่าสินค้าอยู่ในตระกร้า
    [Arguments]    ${item_name}
    Wait Until Element Is Visible    xpath://*[text()="${item_name}"]
    Element Text Should Be    xpath://*[text()="${item_name}"]    ${item_name}

ลบสินค้าออกจากตระกร้าถ้ามี
    [Arguments]    ${removeproduct}
    ${มีสินค้า}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://*[text()="${removeproduct}"]/ancestor::div[@data-test='inventory-item']//button[contains(@class, 'cart_button')]
    IF    ${มีสินค้า}
        Click Button    xpath://*[text()="${removeproduct}"]/ancestor::div[@data-test='inventory-item']//button[contains(@class, 'cart_button')]
    END

ทำความสะอาดหลังจบการทดสอบ
    ลบสินค้าออกจากตระกร้าถ้ามี    Sauce Labs Backpack
    ลบสินค้าออกจากตระกร้าถ้ามี    Sauce Labs Bike Light
    Close Browser