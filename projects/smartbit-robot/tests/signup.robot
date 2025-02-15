*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource        ../resources/Base.resource




*** Test Cases ***
Deve iniciar o cadastro do clientes

    ${account}   Get Fake Account

    start session
    submit signup form    ${account}
    Verify welcome message
    Take Screenshot



Campo nome deve ser obrigatorio

    ${account}     Create Dictionary
    ...    name=${EMPTY}
    ...    email=henrique@teste.com.br
    ...    cpf=14525845256

    start session
    submit signup form    ${account}
    Notice should be     Por favor informe o seu nome completo
    Take Screenshot

    Sleep    10

Campo email deve ser obrigatorio
    
    ${account}     Create Dictionary
    ...     name=Henrique Araujo
    ...     email=${EMPTY}
    ...     cpf=41545875841


    start session
    submit signup form    ${account}
    Notice should be     Por favor, informe o seu melhor e-mail
    Take Screenshot

    Sleep    10

Campo cpf deve ser obrigatorio

    ${account}     Create Dictionary
    ...    name=Henrique Araujo
    ...    email=henrique@teste.com.br
    ...    cpf=${EMPTY}


    start session
    submit signup form    ${account}
    Notice should be     Por favor, informe o seu CPF
    Take Screenshot

    Sleep    10

Email no formato incorreto

    ${account}     Create Dictionary
    ...     name=Henrique Araujo
    ...     email=henrique*teste.com.br
    ...     cpf=15478541542


    start session
    submit signup form    ${account}
    Notice should be    Oops! O email informado é inválido
    Take Screenshot

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
    Take Screenshot

    Sleep    10


