*** Settings ***
Documentation    This test suite is for testing login and logout mechanism of platform
...    consists of successful login-logout, unsuccessful login by invalid credentials and by blank information
Library    SeleniumLibrary
Resource    ../resource/login_logout.resource

*** Keywords ***
Scenario Login With Valid Username And Password Then Logout
    [Documentation]    Scenario to test login-logout action with credentials (username, password) provided
    [Arguments]    ${username}    ${password}
    TRY
        Login by ${username} ${password}
        Open Burger Menu
        Click Logout
    FINALLY
        Close Browser
    END

Scenario Login With Invalid Username And Password
    [Documentation]    Scenario to test unsuccesful login with invalid credentials (username, password) provided
    ...               and check if message displayed is correct to error
    [Arguments]    ${username}    ${password}    ${expected message}
    Connect by browser
    Input Username ${username}
    Input Password ${password}
    Click Login Button
    Receive error message ${expected message}
    Close Browser
    
*** Test Cases ***
Login with valid username and password then logout
    [Documentation]    Verify Login-logout mechanism
    [Template]    Scenario Login With Valid Username And Password Then Logout
    standard_user    secret_sauce
    # locked_out_user    secret_sauce
    problem_user    secret_sauce
    performance_glitch_user    secret_sauce
    error_user    secret_sauce
    visual_user    secret_sauce

Login with invalid username and password
    [Documentation]    Verify unsuccesful login and error message
    [Template]    Scenario Login With Invalid Username And Password
    locked_out_user    secret_sauce    Epic sadface: Sorry, this user has been locked out.
    standard_user    ${EMPTY}    Epic sadface: Password is required
    ${EMPTY}    secret_sauce    Epic sadface: Username is required
    ${EMPTY}    ${EMPTY}    Epic sadface: Username is required
    standard_user    wrong_password    Epic sadface: Username and password do not match any user in this service