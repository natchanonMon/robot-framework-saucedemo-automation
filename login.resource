*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce


*** Keywords ***
เปิดเว็บและเข้าสู่ระบบ
    Open Browser    url=${URL}    browser=${BROWSER}    options=add_experimental_option("prefs", {"profile.password_manager_leak_detection": False})
    Maximize Browser Window
    Wait Until Element Is Visible    id:user-name    10s
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login-button
    Wait Until Element Is Visible    id:inventory_container    10s