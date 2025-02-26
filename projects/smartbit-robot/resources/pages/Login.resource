*** Settings ***
Documentation        Ações e elementos da pagina de login

Library              Browser

*** Keywords ***

Go to login page
    
    Go to     http://localhost:3000/login

Submit login form
    
    [Arguments]        ${email}        ${password}

    Fill Text    css=input[name=email]         ${email}
    Fill Text    css=input[name=password]     ${password}

    Click    css=button >> text=Entrar

User is logged in
    [Arguments]    ${email}

    ${element}    Set Variable    css=.logged-user

    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    equal    ${email}