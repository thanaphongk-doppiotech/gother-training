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
Get Grade
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

Get Total Score
    [Arguments]    @{students}

    ${total}=    Set Variable    0

    FOR    ${student}    IN    @{students}
        ${score}=    Get From Dictionary    ${student}    score
        ${total}=    Evaluate    ${total} + ${score}
    END

    RETURN    ${total}

*** Test Cases ***
TC_001 Verify Grade Of All Students
    Log To Console    \n===== Student Grades =====

    FOR    ${student}    IN    @{STUDENTS}
        ${name}=    Get From Dictionary    ${student}    name
        ${score}=    Get From Dictionary    ${student}    score
        ${grade}=    Get Grade    ${score}

        Log To Console    ${name} | Score=${score} | Grade=${grade}

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

    Log To Console    ===== TC_001 PASSED =====

TC_002 Verify Total Score
    ${total}=    Get Total Score    @{STUDENTS}

    Log To Console    \n===== Total Score =====
    Log To Console    Total Score = ${total}

    Should Be Equal As Integers    ${total}    335

    Log To Console    ===== TC_002 PASSED =====