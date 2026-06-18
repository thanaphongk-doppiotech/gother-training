*** Settings ***
Library    Collections

*** Variables ***
# ข้อ 1: ประกาศชุดข้อมูลนักเรียน 5 คน เป็น List ของ Dictionary
&{student1}    name=Geng      score=${49}
&{student2}    name=Dapper    score=${85}
&{student3}    name=Dream     score=${79}
&{student4}    name=Fon       score=${58}
&{student5}    name=Pat       score=${64}
@{students}    ${student1}    ${student2}    ${student3}    ${student4}    ${student5}

*** Keywords ***
# ข้อ 2: Keyword คำนวณเกรด
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

# ข้อ 3: Keyword คำนวณคะแนนรวม
Calculate Total Score
    [Arguments]    ${student_list}
    ${total}=    Set Variable    ${0}
    FOR    ${student}    IN    @{student_list}
        ${total}=    Evaluate    ${total} + ${student}[score]
    END
    RETURN    ${total}

*** Test Cases ***
# ข้อ 4: TC_001 ตรวจสอบเกรดของทุกคน
TC_001 Verify All Students Grades
    &{expected_grades}=    Create Dictionary    Geng=F    Dapper=A    Dream=B    Fon=D    Pat=C
    
    FOR    ${student}    IN    @{students}
        ${calculated_grade}=    Calculate Grade    ${student}[score]
        ${expected_grade}=    Get From Dictionary    ${expected_grades}    ${student}[name]
        Should Be Equal As Strings    ${calculated_grade}    ${expected_grade}
        Log To Console    Student: ${student}[name] | Score: ${student}[score] | Grade: ${calculated_grade}
    END

# ข้อ 5: TC_002 ตรวจสอบคะแนนรวม (ต้องได้ 335)
TC_002 Verify Total Score
    ${actual_total}=    Calculate Total Score    ${students}
    Should Be Equal As Integers    ${actual_total}    335
    Log To Console    Total Score is ${actual_total} (Expected: 335)