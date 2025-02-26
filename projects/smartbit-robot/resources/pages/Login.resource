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

Toast should Base
    [Arguments]        ${expected_text}

    Wait For Elements State    css=.Toastify__toast-body
    ...         visible    5

    Get Text    css=.Toastify__toast-body
    ...    equal
    ...    ${expected_text}
