*** Settings ***
Library             Collections


*** Variables ***
@{employees}    John    Jane    Doe



*** Keywords ***
For Loop
        FOR     ${number}   IN    @{employees}
                Log To Console    ${number}
        END
        

*** Test Cases ***
TC1
    For Loop
