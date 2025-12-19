*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${base_url}    https://www.saucedemo.com
${browser}    edge
&{page_locator}    
...    login page=id=login_button_container
...    products page=id=inventory_container
...    cart page=id=cart_contents_container

*** Keywords ***
Click Button With Warning
    [Arguments]    ${locator}    ${warn_after}
    ${start_time}=    Get Time    epoch
    Click Button    ${locator}
    ${end_time}=      Get Time    epoch
    ${elapsed}=  Evaluate    ${end_time} - ${start_time}
    Run Keyword If    ${elapsed} > ${warn_after}    Log    Clicking on button took ${elapsed}s    WARN

Wait Until Element Is Visible With Warning
    [Arguments]    ${locator}    ${warn_after}    ${timeout}
    ${start_time}=    Get Time    epoch
    Wait Until Element Is Visible    ${locator}    ${timeout}
    ${end_time}=      Get Time    epoch
    ${elapsed}=  Evaluate    ${end_time} - ${start_time}
    Run Keyword If    ${elapsed} > ${warn_after}    Log    Element took ${elapsed}s to appear    WARN