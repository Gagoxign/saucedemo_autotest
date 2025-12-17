*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/login_logout.resource

*** Keywords ***
Scenario Login With Valid Username And Password
    [Arguments]    ${username}    ${password}
    TRY
        Connect by browser
        Input Username ${username}
        Input Password ${password}
        Click Login Button
        Open Burger Menu
        Click Logout
    FINALLY
        Close Browser
    END

*** Test Cases ***
Login with valid username and password
    [Template]    Scenario Login With Valid Username And Password
    standard_user    secret_sauce
    locked_out_user    secret_sauce
    problem_user    secret_sauce
    performance_glitch_user    secret_sauce
    error_user    secret_sauce
    visual_user    secret_sauce