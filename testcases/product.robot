*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/login_logout.resource
Resource    ../resource/product.resource
Suite Setup    Login by ${username} ${password}
Suite Teardown    Close Browser

*** Variables ***
${username}    standard_user
${password}    secret_sauce

*** Test Cases ***
Add item and remove it in Products page
    [Template]    Scenario Add Item And Remove It In Products Page
    Sauce Labs Backpack
    Sauce Labs Bike Light
    Sauce Labs Bolt T-Shirt
    Sauce Labs Fleece Jacket
    Sauce Labs Onesie
    Test.allTheThings() T-Shirt (Red)

Add Item and Remove it in detail page
    [Template]    Scenario Add Item and Remove it in detail page
    Sauce Labs Backpack
    Sauce Labs Bike Light
    Sauce Labs Bolt T-Shirt
    Sauce Labs Fleece Jacket
    Sauce Labs Onesie
    Test.allTheThings() T-Shirt (Red)

Add item and remove it in cart page
    [Template]    Scenario Add Item And Remove It In Cart Page
    Sauce Labs Backpack
    Sauce Labs Bike Light
    Sauce Labs Bolt T-Shirt
    Sauce Labs Fleece Jacket
    Sauce Labs Onesie
    Test.allTheThings() T-Shirt (Red)
    
*** Keywords ***
Scenario Add Item and Remove it in detail page
    [Arguments]    ${product_name}
    Open Product Detail    ${product_name}
    Click Add To Cart Button On Detail Page
    Click Remove Button On Detail Page
    Go Back To Products Page

Scenario Add Item And Remove It In Products Page
    [Arguments]    ${product_name}
    Click Add To Cart Button on product    ${product_name}
    Click Remove Button on product    ${product_name}

Scenario Add Item And Remove It In Cart Page
    [Arguments]    ${product_name}
    Click Add To Cart Button on product    ${product_name}
    Open Cart
    Page Should Contain    ${product_name}
    Click Remove Button on product    ${product_name}
    Continue Shopping