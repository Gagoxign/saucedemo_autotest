*** Settings ***
Documentation    This test suite is for testing payment action on platform
Library    SeleniumLibrary
Resource    ../resource/payment.resource
Resource    ../resource/login_logout.resource
Resource    ../resource/product.resource
Suite Setup    Login by ${username} ${password}
Suite Teardown    Close Browser

*** Variables ***
${username}    standard_user
${password}    secret_sauce
${first_name}    aaaa
${last_name}    BB
${postal_code}    12300


*** Test Cases ***
Do a checkout successfully
    [Documentation]    Verify if payment action can work properly
    Open Cart
    Checkout
    Input First Name ${first_name}
    Input Last Name ${last_name}
    Input Postal Code ${postal_code}
    Continue Checkout Successfully
    Finish Checkout
    Back To Products

Cancel Before Filling Payment Information
    [Documentation]    Verify cancellation before providing payment information,
    ...                user should return to cart after cancelled
    Open Cart
    Checkout
    Cancel Payment
    Wait Until Element Is Visible With Warning    ${page_locator}[cart page]    1    5

Cancel After Filling Payment Information
    [Documentation]    Verify cancellation after filled payment information,
    ...                user should return to product list after cancelled
    Open Cart
    Checkout
    Input First Name ${first_name}
    Input Last Name ${last_name}
    Input Postal Code ${postal_code}
    Continue Checkout Successfully
    Cancel Payment
    Wait Until Element Is Visible With Warning    ${page_locator}[products page]    1    5

 Miss payment information
    [Documentation]    Verify error message if payment information is missing
    [Template]    Scenario Miss Payment Information
    ${first_name}    ${last_name}    ${EMPTY}    ${error_message}[no postal code]
    ${first_name}    ${EMPTY}    ${postal_code}    ${error_message}[no last name]
    ${EMPTY}    ${last_name}    ${postal_code}    ${error_message}[no first name]
    ${first_name}    ${EMPTY}    ${EMPTY}    ${error_message}[no last name]
    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${error_message}[no first name]

*** Keywords ***
Scenario Miss Payment Information
    [Documentation]    Scenario for doing a checkout but missing payment information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}    ${expected_message}
    Open Cart
    Checkout
    Input First Name ${first_name}
    Input Last Name ${last_name}
    Input Postal Code ${postal_code}
    Continue Checkout With Error ${expected_message}
    Cancel Payment
    Wait Until Element Is Visible With Warning    ${page_locator}[cart page]    1    5