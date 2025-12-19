*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/payment.resource
Resource    ../resource/login_logout.resource
Resource    ../resource/product.resource
Suite Setup    Login by ${username} ${password}
Suite Teardown    Close Browser
Documentation    

*** Variables ***
${username}    standard_user
${password}    secret_sauce
${first_name}    aaaa
${last_name}    BB
${postal_code}    12300


*** Test Cases ***
Do a checkout successfully
    Open Cart
    Checkout
    Input First Name ${first_name}
    Input Last Name ${last_name}
    Input Postal Code ${postal_code}
    Continue Checkout Successfully
    Finish Checkout
    Back To Products

Cancel Before Filling Payment Information
    Open Cart
    Checkout
    Cancel Payment
    Wait Until Element Is Visible With Warning    ${page_locator}[cart page]    1    5

Cancel After Filling Payment Information
    Open Cart
    Checkout
    Input First Name ${first_name}
    Input Last Name ${last_name}
    Input Postal Code ${postal_code}
    Continue Checkout Successfully
    Cancel Payment
    Wait Until Element Is Visible With Warning    ${page_locator}[products page]    1    5

Scenario miss payment information
    [Template]    Miss Payment Information
    ${first_name}    ${last_name}    ${EMPTY}    ${error_message}[no postal code]
    ${first_name}    ${EMPTY}    ${postal_code}    ${error_message}[no last name]
    ${EMPTY}    ${last_name}    ${postal_code}    ${error_message}[no first name]
    ${first_name}    ${EMPTY}    ${EMPTY}    ${error_message}[no last name]
    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${error_message}[no first name]

*** Keywords ***
Miss Payment Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}    ${expected_message}
    Open Cart
    Checkout
    Input First Name ${first_name}
    Input Last Name ${last_name}
    Input Postal Code ${postal_code}
    Continue Checkout With Error ${expected_message}
    Cancel Payment
    Wait Until Element Is Visible With Warning    ${page_locator}[cart page]    1    5