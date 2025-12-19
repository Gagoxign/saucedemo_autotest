*** Settings ***
Library    SeleniumLibrary
Resource    common.resource

*** Variables ***
&{checkout_locator}    
...    continue shopping button=id=continue-shopping
...    checkout button=id=checkout
...    checkout info page=id=checkout_info_container
...    first name=id=first-name    
...    last name=id=last-name    
...    postal code=id=postal-code
...    continue button=id=continue
...    checkout summary page=id=checkout_summary_container
...    finish button=id=finish
...    checkout complete page=id=checkout_complete_container
...    back home button=id=back-to-products

*** Keywords ***
Checkout
    [Arguments]    ${warn_after}=1    ${timeout}=5
    Click Button With Warning    ${checkout_locator}[checkout button]    ${warn_after}
    Wait Until Element Is Visible With Warning    ${checkout_locator}[checkout info page]    ${warn_after}    ${timeout}

Input First Name ${fisrt_name}
    Input Text    ${checkout_locator}[first name]    ${fisrt_name}

Input Last Name ${last_name}
    Input Text    ${checkout_locator}[last name]    ${last_name}

Input Postal Code ${postal_code}
    Input Text    ${checkout_locator}[postal code]    ${postal_code}

Continue Checkout
    [Arguments]    ${warn_after}=1    ${timeout}=5
    Click Button With Warning    ${checkout_locator}[continue button]    ${warn_after}
    Wait Until Element Is Visible With Warning    ${checkout_locator}[checkout summary page]    ${warn_after}    ${timeout}

Finish Checkout
    [Arguments]    ${warn_after}=1    ${timeout}=5
    Click Button With Warning    ${checkout_locator}[finish button]    ${warn_after}
    Wait Until Element Is Visible With Warning    ${checkout_locator}[checkout complete page]    ${warn_after}    ${timeout}

Back To Products
    [Arguments]    ${warn_after}=1    ${timeout}=5
    Click Button With Warning    ${checkout_locator}[back home button]    ${warn_after}
    Wait Until Element Is Visible With Warning    ${page_locator}[products page]    ${warn_after}    ${timeout}
