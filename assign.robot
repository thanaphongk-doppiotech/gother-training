*** Settings ***
Library    Collections

*** Variables ***
@{STUDENTS}
...    {"name":"Geng","score":49}
...    {"name":"Dapper","score":85}
...    {"name":"Dream","score":79}
...    {"name":"Fon","score":58}
...    {"name":"Pat","score":64}

*** Keywords ***
Calculate Grade
    [Arguments]    ${score}

    IF    ${score} >= 80
        RETURN    A
    ELSE IF    ${score} >= 70
        RETURN    B
    ELSE IF    ${score} >= 60
        RETURN    C
    ELSE IF    ${score} >= 50
        RETURN    D
    ELSE
        RETURN    F
    END

Calculate Total Score
    [Arguments]    @{students}

    ${total}=    Set Variable    0

    FOR    ${student}    IN    @{students}
        ${score}=    Get From Dictionary    ${student}    score
        ${total}=    Evaluate    ${total} + ${score}
    END

    RETURN    ${total}

*** Test Cases ***
TC_001 Verify Grade Of All Students
    FOR    ${student}    IN    @{STUDENTS}
        ${name}=    Get From Dictionary    ${student}    name
        ${score}=    Get From Dictionary    ${student}    score

        ${grade}=    Calculate Grade    ${score}

        IF    '${name}' == 'Geng'
            Should Be Equal    ${grade}    F
        ELSE IF    '${name}' == 'Dapper'
            Should Be Equal    ${grade}    A
        ELSE IF    '${name}' == 'Dream'
            Should Be Equal    ${grade}    B
        ELSE IF    '${name}' == 'Fon'
            Should Be Equal    ${grade}    D
        ELSE IF    '${name}' == 'Pat'
            Should Be Equal    ${grade}    C
        END
    END

TC_002 Verify Total Score
    ${total}=    Calculate Total Score    @{STUDENTS}
    Should Be Equal As Integers    ${total}    335