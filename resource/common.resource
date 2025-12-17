*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Click Button With Warning
    [Arguments]    ${locator}    ${warn_after}
    ${start_time}=    Get Time    epoch
    Click Button    ${locator}
    ${end_time}=      Get Time    epoch
    ${elapsed}=  Evaluate    ${end_time} - ${start_time}
    Run Keyword If    ${elapsed} > ${warn_after}    Log    Clicking on button took ${elapsed}s    WARN

Wait Until Element Is Visible With Warning
    [Arguments]    ${locator}    ${warn_after}    ${timeout}
    ${start_time}=    Get Time    epoch
    Wait Until Element Is Visible    ${locator}    ${timeout}
    ${end_time}=      Get Time    epoch
    ${elapsed}=  Evaluate    ${end_time} - ${start_time}
    Run Keyword If    ${elapsed} > ${warn_after}    Log    Element took ${elapsed}s to appear    WARN