*** Settings ***
Documentation    This test suite is for testing available actions on product pages after logged in,
...              consists of all products page and detail product pages
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
    [Documentation]    Verify adding item and removing item action on all products page
    [Template]    Scenario Add Item And Remove It In Products Page
    Sauce Labs Backpack
    Sauce Labs Bike Light
    Sauce Labs Bolt T-Shirt
    Sauce Labs Fleece Jacket
    Sauce Labs Onesie
    Test.allTheThings() T-Shirt (Red)

Add Item and Remove it in detail page
    [Documentation]    Verify adding item and removing item action on detail product page of that item
    [Template]    Scenario Add Item and Remove it in detail page
    Sauce Labs Backpack
    Sauce Labs Bike Light
    Sauce Labs Bolt T-Shirt
    Sauce Labs Fleece Jacket
    Sauce Labs Onesie
    Test.allTheThings() T-Shirt (Red)

Add item and remove it in cart page
    [Documentation]    Verify item added can be removed in cart page
    [Template]    Scenario Add Item And Remove It In Cart Page
    Sauce Labs Backpack
    Sauce Labs Bike Light
    Sauce Labs Bolt T-Shirt
    Sauce Labs Fleece Jacket
    Sauce Labs Onesie
    Test.allTheThings() T-Shirt (Red)
    
*** Keywords ***
Scenario Add Item and Remove it in detail page
    [Documentation]    Scenario to open detail product page then add/remove item 
    [Arguments]    ${product_name}
    Open Product Detail    ${product_name}
    Click Add To Cart Button On Detail Page
    Click Remove Button On Detail Page
    Go Back To Products Page

Scenario Add Item And Remove It In Products Page
    [Documentation]    Scenario to add and remove item by detecting its product name on all products page
    [Arguments]    ${product_name}
    Click Add To Cart Button on product    ${product_name}
    Click Remove Button on product    ${product_name}

Scenario Add Item And Remove It In Cart Page
    [Documentation]    Scenario to add an item then remove it from cart page
    [Arguments]    ${product_name}
    Click Add To Cart Button on product    ${product_name}
    Open Cart
    Page Should Contain    ${product_name}
    Click Remove Button on product    ${product_name}
    Continue Shopping