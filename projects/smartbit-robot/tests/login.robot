*** Settings ***

Documentation        Cenários de testes de login SAC

Resource             ../resources/Base.resource

Test Setup           start session
Test Teardown        Take Screenshot



*** Test Cases ***

Deve logar como Gestor de Academia

    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Não deve logar com senha incorreta
    [Tags]     inv_pass
    Go to login page
    Submit login form    sac@smartbit.com    abc124
    
    Toast should Base    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com email não cadastrado
    [Tags]     email_404
    Go to login page
    Submit login form    404@smartbit.com    pwd123
    
    Toast should Base    As credenciais de acesso fornecidas são inválidas. Tente novamente!



    # procedimento para pegar o html
    # Sleep    3
    # ${temp}     Get Page Source
    # Log         ${temp}

Tentativa de login com dados incorretos
    [Template]           Login with verify notice
    ${EMPTY}             ${EMPTY}        Os campos email e senha são obrigatórios.
    ${EMPTY}             pwd123          Os campos email e senha são obrigatórios.
    sac@smartbit.com     ${EMPTY}        Os campos email e senha são obrigatórios.
    www.teste.com.br     pwd123          Oops! O email informado é inválido
    sac&gmail.com        pwd123          Oops! O email informado é inválido
    adsfgsfsgaf          pwd123          Oops! O email informado é inválido
    jhghsh87dss7         pwd123          Oops! O email informado é inválido
    ^&^gh**^&^&          pwd123          Oops! O email informado é inválido
    test*gmail.com       pwd123          Oops! O email informado é inválido
    yahoo.com@&*         pwd123          Oops! O email informado é inválido
*** Keywords ***
Login with verify notice
    [Arguments]        ${email}        ${password}        ${output_message}

    Go to login page
    Submit login form    ${email}    ${password}
    Notice should be     ${output_message}