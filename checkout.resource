*** Variables ***


*** Keywords ***
กดปุ่มชำระเงิน
    Wait Until Element Is Visible    id:checkout
    Click Button    id:checkout

ใส่ข้อมูลที่อยู่จัดส่งสินค้า
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Wait Until Element Is Visible    xpath://*[text()="Checkout: Your Information"]
    Input Text    id:first-name    ${first_name}
    Input Text    id:last-name    ${last_name}
    Input Text    id:postal-code    ${postal_code}

กดปุ่ม Continue
    Wait Until Element Is Visible    id:continue
    Click Button    id:continue

ตรวจสอบผลรวมของราคาสินค้ากับยอดภาษี
    Wait Until Element Is Visible    xpath://*[@data-test='payment-info-value']
    Element Text Should Be    xpath://*[@data-test='payment-info-value']    SauceCard #31337

    Wait Until Element Is Visible    xpath://*[@data-test='shipping-info-value']
    Element Text Should Be    xpath://*[@data-test='shipping-info-value']    Free Pony Express Delivery!

    ${item_total}=    Get Text    xpath://*[@data-test='subtotal-label']
    ${tax}=           Get Text    xpath://*[@data-test='tax-label']
    ${total}=         Get Text    xpath://*[@data-test='total-label']

    ${item_total_number}=    Replace String    ${item_total}    Item total: $    ${EMPTY}
    ${item_tax_number}=      Replace String    ${tax}           Tax: $           ${EMPTY}
    ${total_number}=         Replace String    ${total}         Total: $         ${EMPTY}

    ${item_total_number}=    Convert To Number    ${item_total_number}
    ${item_tax_number}=      Convert To Number    ${item_tax_number}
    ${total_number}=         Convert To Number    ${total_number}

    ${expected_total}=    Evaluate    ${item_total_number} + ${item_tax_number}

    Should Be Equal As Numbers    ${expected_total}    ${total_number}

ตรวจสอบสินค้าที่สั่งว่ายังอยู่ในหน้าคำนวณราคา
    [Arguments]    ${ordereditems}    ${numberofitemsordered}
    Wait Until Element Is Visible    xpath://*[text()="${ordereditems}"]
    Element Text Should Be    xpath://*[text()="${ordereditems}"]    ${ordereditems}

    Wait Until Element Is Visible    xpath://*[text()="${ordereditems}"]/ancestor::div[@data-test='inventory-item']//div[@data-test='item-quantity']
    Element Text Should Be    xpath://*[text()="${ordereditems}"]/ancestor::div[@data-test='inventory-item']//div[@data-test='item-quantity']    ${numberofitemsordered}

กดปุ่ม Finish
    Wait Until Element Is Visible    id:finish
    Click Button    id:finish

ตรวจสอบว่าต้องพบหน้าขอบคุณการสั่งซื้อสินค้า
    Wait Until Element Is Visible    xpath://*[@data-test='complete-header']
    Element Text Should Be    xpath://*[@data-test='complete-header']    Thank you for your order!

