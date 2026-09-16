*** Settings ***
Library    SeleniumLibrary
Test SetUp    เปิดหน้าเว็บ SauceDemo
Test Teardown    Close Browser
Test Template    Login ควรล้มเหลว


*** Test Cases ***
Login ด้วย Password ผิด       standard_user    wrong_password    Epic sadface: Username and password do not match any user in this service
Login ไม่กรอก Username        ${EMPTY}         secret_sauce      Epic sadface: Username is required
Login ไม่กรอก Password        standard_user    ${EMPTY}           Epic sadface: Password is required
Login ด้วย Username ผิด       invalid_user     secret_sauce      Epic sadface: Username and password do not match any user in this service

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome

*** Keywords ***
เปิดหน้าเว็บ SauceDemo
    Open Browser    url=${URL}    browser=${BROWSER}    options=add_experimental_option("prefs", {"profile.password_manager_leak_detection": False})
    Maximize Browser Window
    Wait Until Element Is Visible    id:user-name

Login ควรล้มเหลว
    [Arguments]    ${username}    ${password}    ${expected_error}
    Input Text    id:user-name    ${username}
    Input Text    id:password    ${password}
    Click Button    id:login-button
    Element Should Contain    css:[data-test="error"]    ${expected_error}
    Page Should Not Contain Element    id:inventory_container