*** Settings ***
Documentation                  Ações e elementos do componentes de caixa de notificação

Library                        Browser


*** Keywords ***


Notice should be

    [Arguments]        ${target}

    ${element}     Set Variable    css=form .notice

    Wait For Elements State
    ...    css=form .notice    visible    5
    
    Get Text    ${element}    equal    ${target}