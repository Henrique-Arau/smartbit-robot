*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Library        Browser

Resource        ../resources/base.resource



*** Test Cases ***
Deve iniciar o cadastro do clientes

    ${account}   Get Fake Account

    New Browser  browser=chromium    headless=False
    New Page     http://localhost:3000

    Get Text     css=#signup h2    equal     Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name          ${account}[name]
    Fill Text    id=email         ${account}[email]
    Fill Text    id=document      ${account}[document]

    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    text=Falta pouco para fazer parte da família Smartbit!    visible    5

    Sleep    10

Campo nome deve ser obrigatorio


    New Browser  browser=chromium    headless=False
    New Page     http://localhost:3000

    Get Text     css=#signup h2     equal     Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=email         henrique@teste.com.br
    Fill Text    id=document      05214785451

    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=form .notice    visible    5
    
    Get Text    css=form .notice    equal    Por favor informe o seu nome completo

    Sleep    10

Campo email deve ser obrigatorio
    [Tags]    required


    New Browser  browser=chromium    headless=False
    New Page     http://localhost:3000

    Get Text     css=#signup h2     equal     Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name          Henrique Araujo
    Fill Text    id=document      05214785451

    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=form .notice    visible    5
    
    Get Text    css=form .notice    equal    Por favor, informe o seu melhor e-mail

    Sleep    10