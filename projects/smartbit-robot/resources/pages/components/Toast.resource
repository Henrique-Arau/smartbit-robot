*** Settings ***
Documentation            Ações e elementos do componente Toast

Library                  Browser


*** Keywords ***

Toast should Base
    [Arguments]        ${expected_text}

    Wait For Elements State    css=.Toastify__toast-body
    ...         visible    5

    Get Text    css=.Toastify__toast-body
    ...    equal
    ...    ${expected_text}