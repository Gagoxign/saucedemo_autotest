*** Settings ***
Library    SeleniumLibrary
Resource    common.resource

*** Variables ***
&{product_0}    name=Sauce Labs Backpack    price=$29.99
&{product_1}    name=Sauce Labs Bike Light    price=$9.99
&{product_2}    name=Sauce Labs Bolt T-Shirt    price=$15.99
&{product_3}    name=Sauce Labs Fleece Jacket    price=$49.99
&{product_4}    name=Sauce Labs Onesie    price=$7.99
&{product_5}    name=Test.allTheThings() T-Shirt (Red)    price=$15.99

@{products}
...    &{product_0}
...    &{product_1}
...    &{product_2}
...    &{product_3}
...    &{product_4}
...    &{product_5}

&{add_product_button_locator}    
...    Sauce Labs Backpack=id:add-to-cart-sauce-labs-backpack    
...    Sauce Labs Bike Light=id:add-to-cart-sauce-labs-bike-light    
...    Sauce Labs Bolt T-Shirt=id:add-to-cart-sauce-labs-bolt-t-shirt    
...    Sauce Labs Fleece Jacket=id:add-to-cart-sauce-labs-fleece-jacket    
...    Sauce Labs Onesie=id:add-to-cart-sauce-labs-onesie    
...    Test.allTheThings() T-Shirt (Red)=id:add-to-cart-test.allthethings()-t-shirt-(red)

&{remove_product_button_locator}    
...    Sauce Labs Backpack=id:remove-sauce-labs-backpack    
...    Sauce Labs Bike Light=id:remove-sauce-labs-bike-light    
...    Sauce Labs Bolt T-Shirt=id:remove-sauce-labs-bolt-t-shirt    
...    Sauce Labs Fleece Jacket=id:remove-sauce-labs-fleece-jacket    
...    Sauce Labs Onesie=id:remove-sauce-labs-onesie    
...    Test.allTheThings() T-Shirt (Red)=id:remove-test.allthethings()-t-shirt-(red)

&{detail_product_locator}
...    add button=id=add-to-cart
...    remove button=id=remove
...    back button=id=back-to-products

&{cart_locator}    
...    Cart Link=xpath=//a[@data-test="shopping-cart-link"]
...    Cart Badge=xpath=//a[@data-test="shopping-cart-link"]//span[@data-test="shopping-cart-badge"]
...    Continue Shopping Button=id=continue-shopping


*** Keywords ***
Click Add To Cart Button on product
    [Arguments]    ${product_name}
    Click Element     ${add_product_button_locator}[${product_name}]

Click Remove Button on product
    [Arguments]    ${product_name}
    Click Element     ${remove_product_button_locator}[${product_name}]

Open Product Detail
    [Arguments]    ${product_name}
    Click Element    //div[@data-test="inventory-item-name" and text()="${product_name}"]
    Wait Until Element Is Visible With Warning    //div[@class="inventory_details"]    warn_after=1    timeout=5

Click Add To Cart Button On Detail Page
    Click Element     ${detail_product_locator}[add button]
    Element Should Not Be Visible    ${detail_product_locator}[add button]

Click Remove Button On Detail Page
    Click Element     ${detail_product_locator}[remove button]
    Element Should Not Be Visible    ${detail_product_locator}[remove button]

Go Back To Products Page
    [Arguments]    ${warn_after}=1    ${timeout}=5
    Click Element    ${detail_product_locator}[back button]
    Wait Until Element Is Visible With Warning    ${page_locator}[products page]    ${warn_after}    ${timeout}

Open Cart
    [Arguments]    ${warn_after}=1    ${timeout}=5
    Click Element    ${cart_locator}[Cart Link]
    Wait Until Element Is Visible With Warning    ${page_locator}[cart page]    ${warn_after}    ${timeout}

Count Item In Cart
    TRY
        ${text}=    Get Value    ${cart_locator}[Cart Badge]
        ${count_item}=    Convert To Integer    ${text}
    EXCEPT
        ${count_item}=    Convert To Integer    0
    END
    RETURN    ${count_item}

Continue Shopping
    [Arguments]    ${warn_after}=1    ${timeout}=5
    Click Element    ${cart_locator}[Continue Shopping Button]
    Wait Until Element Is Visible With Warning    ${page_locator}[products page]    ${warn_after}    ${timeout}
    