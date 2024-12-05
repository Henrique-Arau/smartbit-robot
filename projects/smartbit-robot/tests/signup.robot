*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Library        Browser

Resource        ../resources/base.resource



*** Test Cases ***
Deve iniciar o cadastro do clientes

    ${account}   Get Fake Account

    start session
    submit signup form    ${account}

    Wait For Elements State
    ...    text=Falta pouco para fazer parte da família Smartbit!    visible    5

    Sleep    10

Campo nome deve ser obrigatorio

    ${account}     Create Dictionary
    ...    name=${EMPTY}
    ...    email=henrique@teste.com.br
    ...    cpf=14525845256

    start session
    submit signup form    ${account}
    Notice should be     Por favor informe o seu nome completo

    Sleep    10

Campo email deve ser obrigatorio
    
    ${account}     Create Dictionary
    ...     name=Henrique Araujo
    ...     email=${EMPTY}
    ...     cpf=41545875841


    start session
    submit signup form    ${account}
    Notice should be     Por favor, informe o seu melhor e-mail

    Sleep    10

Campo cpf deve ser obrigatorio

    ${account}     Create Dictionary
    ...    name=Henrique Araujo
    ...    email=henrique@teste.com.br
    ...    cpf=${EMPTY}


    start session
    submit signup form    ${account}
    Notice should be     Por favor, informe o seu CPF

    Sleep    10

Email no formato incorreto

    ${account}     Create Dictionary
    ...     name=Henrique Araujo
    ...     email=henrique*teste.com.br
    ...     cpf=15478541542


    start session
    submit signup form    ${account}
    Notice should be    Oops! O email informado é inválido

    Sleep    10

CPF no formato incorreto
    [Tags]    required

    ${account}     Create Dictionary
    ...     name=Henrique Araujo
    ...     email=henrique@teste.com.br
    ...     cpf=154785415ab

    start session
    submit signup form    ${account}
    Notice should be   Oops! O CPF informado é inválido

    Sleep    10

*** Keywords ***
start session

    New Browser  browser=chromium    headless=False
    New Page     http://localhost:3000

submit signup form
    [Arguments]     ${account}

    Get Text     css=#signup h2    equal     Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name          ${account}[name]
    Fill Text    id=email         ${account}[email]
    Fill Text    id=cpf           ${account}[cpf]

    Click    css=button >> text=Cadastrar

Notice should be

    [Arguments]        ${target}

    ${element}     Set Variable    css=form .notice

    Wait For Elements State
    ...    css=form .notice    visible    5
    
    Get Text    ${element}    equal    ${target}