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
Do a checkout
    Open Cart
    Checkout
    Input First Name ${first_name}
    Input Last Name ${last_name}
    Input Postal Code ${postal_code}
    Continue Checkout
    Finish Checkout
    Back To Products
