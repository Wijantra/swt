*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
Test access to Facebook and post on timeline
    พิมพ์ Facebook
    พิมพ์ email
    พิมพ์ password
    ตรวจสอบ email 
    ตรวจสอบ password
    กด Enter
    Check user name
    Delete notification
    Click post
    Post message
    Enter Post

*** Keywords ***
พิมพ์ Facebook
    Open Browser    https://www.facebook.com/login   chrome

พิมพ์ email
    Input Text    name:email    email

พิมพ์ password
    Input Text    name:pass    password

ตรวจสอบ email
    Wait Until Page Contains Element    name:email
    Textfield Value Should Be    name:email    email

ตรวจสอบ password
    Wait Until Page Contains Element    name:pass
    Textfield Value Should Be    name:pass    password

กด Enter
    Press Keys    name:pass    RETURN

Check user name
    Page Should Contain    Dungding Wijantra

Delete notification
    Wait Until Element Is Enabled    xpath://div[@role="alertdialog"]
    Press Keys    xpath://div[@role="alertdialog"]    RETURN

Click post
    Wait Until Page Contains Element    xpath://div[@class="m9osqain a5q79mjw jm1wdb64 k4urcfbm"]
    Click Element    xpath://div[@class="m9osqain a5q79mjw jm1wdb64 k4urcfbm"]

Post message
    Wait Until Element Is Enabled    xpath://form[@method='POST']//div[@role="button"]
    Press Keys    None    สวัสดี Robot Framework

Enter Post
    Wait Until Page Contains Element    xpath://div[@class="k4urcfbm dati1w0a hv4rvrfc i1fnvgqd j83agx80 rq0escxv bp9cbjyn discj3wi"]
    Press Keys    xpath://div[@class="k4urcfbm dati1w0a hv4rvrfc i1fnvgqd j83agx80 rq0escxv bp9cbjyn discj3wi"]    RETURN
