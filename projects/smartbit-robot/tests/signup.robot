*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Library        Browser


*** Test Cases ***
Deve iniciar o cadastro do clientes
    New Browser  browser=chromium    headless=False
    New Page     http://localhost:3000

    Get Text     css=#signup h2    equal     Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name          Henrique Araujo
    Fill Text    id=email         teste00@teste.com
    Fill Text    id=document      10892375027

    Click    css=button >> text=Cadastrar

    Wait For Elements State  text=Falta pouco para fazer parte da família Smartbit!    visible    5

    Sleep    10