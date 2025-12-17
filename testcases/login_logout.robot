*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/login_logout.resource

*** Keywords ***
Scenario Login With Valid Username And Password Then Logout
    [Arguments]    ${username}    ${password}
    TRY
        Connect by browser
        Input Username ${username}
        Input Password ${password}
        Click Login Button
        Login successfully
        Open Burger Menu
        Click Logout
    FINALLY
        Close Browser
    END

Scenario Login With Invalid Username And Password
    [Arguments]    ${username}    ${password}    ${expected message}
    Connect by browser
    Input Username ${username}
    Input Password ${password}
    Click Login Button
    Receive error message ${expected message}
    Close Browser
    
*** Test Cases ***
Login with valid username and password then logout
    [Template]    Scenario Login With Valid Username And Password Then Logout
    standard_user    secret_sauce
    # locked_out_user    secret_sauce
    problem_user    secret_sauce
    performance_glitch_user    secret_sauce
    error_user    secret_sauce
    visual_user    secret_sauce

Login with invalid username and password
    [Template]    Scenario Login With Invalid Username And Password
    locked_out_user    secret_sauce    Epic sadface: Sorry, this user has been locked out.
    standard_user    ${EMPTY}    Epic sadface: Password is required
    ${EMPTY}    secret_sauce    Epic sadface: Username is required
    ${EMPTY}    ${EMPTY}    Epic sadface: Username is required
    standard_user    wrong_password    Epic sadface: Username and password do not match any user in this service