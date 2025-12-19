# saucedemo_autotest
Automated tests for online commercial platform Sauce Demo. 
Tests are developed by Robot Framework  (https://robotframework.org/)

## Test plan

### Objectives
- Test to validate online commercial platform Sauce Demo at https://www.saucedemo.com/
- Verify all available features on website of platform
- Verify UI/UX of website
- Performance of responsiveness

### Scope
- Login and logout mechanism
- All product list and each detail product
- Shopping cart
- Checkout process

### Tools
- Python
- Robot Framework
- Selenium
- Microsoft Edge WebDriver
- Git

## Installation
1. Install Python V3: https://www.python.org/downloads/    (Recommend Python V3.10 or higher)
2. Create virtual environment at folder ./venv
    ```
    python -m venv venv
    ```
3. Activate virtual environment
    ```
    .\venv\Scripts\activate
    ```
4. Install all libraries from requirement file
    ```
    pip install -r .\requirements.txt
    ```
5. (Dev by Visual Studio Code) Install Extension for Robot Framework: https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode

## Execution
- Run all test suites 
    ```
    robot .\testcases\
    ```
- Execute login logout test suite
    ```
    robot .\testcases\login_logout.robot
    ```
- Execute payment (or product) test suite with standard credentials
    ```
    robot .\testcases\payment.robot
    ```
- Execute payment (or product) test suite with other username/password (for example username = other_username, password = other_password)
    ```
    robot --variable username:other_username --variable password:other_password .\testcases\payment.robot
    ```
