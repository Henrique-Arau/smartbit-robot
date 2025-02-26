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