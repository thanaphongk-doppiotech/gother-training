*** Variables ***

&{student1}    name=Geng      score=49
&{student2}    name=Dapper    score=85
&{student3}    name=Dream     score=79
&{student4}    name=Fon       score=58
&{student5}    name=Pat       score=64

@{students}
...    ${student1}
...    ${student2}
...    ${student3}
...    ${student4}
...    ${student5}
# @{students}    ${student1}    ${student2}    ${student3}    ${student4}    ${student5}

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
        ${total}=    Evaluate
        ...    ${total}+${student["score"]}
    END

    RETURN    ${total}

*** Test Cases ***

TC_001 Verify Grade

    ${grade}=    Calculate Grade    85
    Should Be Equal    ${grade}    A

    ${grade}=    Calculate Grade    79
    Should Be Equal    ${grade}    B

    ${grade}=    Calculate Grade    58
    Should Be Equal    ${grade}    D

    ${grade}=    Calculate Grade    64
    Should Be Equal    ${grade}    C

     ${grade}=    Calculate Grade    49
    Should Be Equal    ${grade}    F


TC_002 Verify Total Score

    ${total}=    Calculate Total Score    @{students}

    Should Be Equal As Integers
    ...    ${total}
    ...    335




