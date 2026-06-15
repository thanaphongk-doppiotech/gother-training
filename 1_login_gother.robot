*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}      https://gother.com
${USERNAME}    tigtester01@gmail.com
${PASSWORD}    t!G123456

Suite Setup    Initialize WebDriver

*** Test Cases ***
Valid Login
    Go To    ${URL}
    Maximize Browser Window
    Click Element    //a[contains(text(),"Login") or contains(text(),"เข้าสู่ระบบ")]
    Sleep    2s
    Input Text    //input[@type="email" or @type="text"]    ${USERNAME}
    Input Text    //input[@type="password"]    ${PASSWORD}
    Click Element    //button[contains(text(),"Sign") or contains(text(),"เข้าสู่ระบบ/สมัครสมาชิก")]
    Sleep    5s
    Wait Until Element Is Visible    //a[contains(text(),"Logout") or contains(text(),"ออกจากระบบ")]

Suite Teardown    Close All Browsers

*** Keywords ***
Initialize WebDriver
    ${driver_path}=    Run Python Script    import webdriver_manager; from webdriver_manager.chrome import ChromeDriverManager; from selenium.webdriver.chrome.service import Service; print(Service(ChromeDriverManager().install()).executable_path)
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${chrome_options}    add_argument    --headless=new
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r"${driver_path}")    sys
    Create WebDriver    Chrome    options=${chrome_options}    service=${service}