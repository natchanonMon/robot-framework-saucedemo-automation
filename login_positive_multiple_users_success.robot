*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
Force Tags    regression

*** Test Cases ***
Login SauceDemo เช็คหลายไอดี สำเร็จ
    เปิด SauceDemo
    FOR    ${USERMULTIPLE}    IN    @{USER}
    Log    ทดสอบไอดี:${USERMULTIPLE}
    Input Text    id:user-name    ${USERMULTIPLE}
    Input Text    id:password    ${PASS}
    Click Button    id:login-button
    Wait Until Element Is Visible    class:title
    Element Text Should Be    class:title    Products
    Click Element    id:react-burger-menu-btn
    Wait Until Element Is Visible    id:logout_sidebar_link
    Click Element    id:logout_sidebar_link
    Wait Until Element Is Visible    class:login_logo
    END

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
@{USER}    standard_user    problem_user    performance_glitch_user    error_user    visual_user
${PASS}    secret_sauce


*** Keywords ***
เปิด SauceDemo
    Open Browser    url=${URL}    browser=${BROWSER}    options=add_experimental_option("prefs", {"profile.password_manager_leak_detection": False})
    Maximize Browser Window