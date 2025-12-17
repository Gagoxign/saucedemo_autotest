*** Settings ***
Library    SeleniumLibrary
Resource    common.resource

*** Variables ***
${base_url}    https://www.saucedemo.com
${browser}    edge
&{locator}    username=id=user-name    password=id=password    login_button=id=login-button
...            menu_button=id=react-burger-menu-btn    logout_anchor=id=logout_sidebar_link

*** Keywords ***
Connect by browser
    Open Browser    ${base_url}    ${browser}
    Maximize Browser Window

Input Username ${username}
    Input Text    ${locator}[username]    ${username}

Input Password ${password}
    Input Text    ${locator}[password]    ${password}

Click Login Button
    [Arguments]    ${warn_after}=1
    Click Button With Warning    ${locator}[login_button]    ${warn_after}

Login successfully
    [Arguments]    ${warn_after}=1    ${timeout}=5
    Wait Until Element Is Visible With Warning    id=inventory_container    ${warn_after}    ${timeout}

Receive error message ${expected_message}
    [Arguments]        ${timeout}=5
    Wait Until Page Contains    ${expected_message}    ${timeout}

Open Burger Menu
    [Arguments]    ${warn_after}=1    ${timeout}=5
    Click Button With Warning    ${locator}[menu_button]    ${warn_after}
    Wait Until Element Is Visible With Warning    ${locator}[logout_anchor]    ${warn_after}    ${timeout}

Click Logout
    [Arguments]    ${warn_after}=1    ${timeout}=5
    Click Element    ${locator}[logout_anchor]
    Wait Until Element Is Visible With Warning    ${locator}[login_button]    ${warn_after}    ${timeout}
