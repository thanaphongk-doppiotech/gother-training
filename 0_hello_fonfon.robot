*** Settings ***
# Library         Collections
# Test Setup      BuiltIn.Log to console    Test Setup
# Test Teardown   BuiltIn.Log to console    Test Teardown
# Suite Setup     BuiltIn.Log to console    Suite Setup
# Suite Teardown  BuiltIn.Log to console    Suite Teardown

*** Variables ***
@{employee}    Shelby    Shelbu   Shelboo



*** Keywords ***
# My log to console
#     [Arguments]    ${message}
#     Log to console    ${message}
# Payment Leaderboard
#     [Arguments]    ${name}
#     IF  '${name}' == 'PTAA'
#         Log To Console   "Leader"
#     ELSE IF  '${name}' == 'PPUU'
#         Log To Console   "Backend"
#     ELSE
#         Log To Console   "อื่นๆ"
#     END
For loop
    FOR    ${number}    IN     @{employee}
        Log To Console    ${number}
        
    END
    

*** Test Cases ***
TC1
    For Loop
