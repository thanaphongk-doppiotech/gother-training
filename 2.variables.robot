*** Settings ***
#library         Collections
Variables    variables.yaml

*** Test Cases ***
TC1
    [Tags]    TC1
    BuiltIn.Log to console    ${Hero}
    BuiltIn.Log to console    ${Villain}
    BuiltIn.Log to console    ${Antihero}
    
