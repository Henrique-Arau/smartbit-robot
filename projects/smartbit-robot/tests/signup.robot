*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource        ../resources/Base.resource

Test Setup       start session
Test Teardown    Take Screenshot


*** Test Cases ***
Deve iniciar o cadastro do clientes

    ${account}   Get Fake Account

 
    submit signup form    ${account}
    Verify welcome message



#Campo nome deve ser obrigatorio

#    ${account}     Create Dictionary
#    ...    name=${EMPTY}
#    ...    email=henrique@teste.com.br
#   ...    cpf=14525845256

#    submit signup form    ${account}
#    Notice should be     Por favor informe o seu nome completo

# Campo email deve ser obrigatorio
    
#     ${account}     Create Dictionary
#     ...     name=Henrique Araujo
#     ...     email=${EMPTY}
#     ...     cpf=41545875841


#     submit signup form    ${account}
#     Notice should be     Por favor, informe o seu melhor e-mail


# Campo cpf deve ser obrigatorio

#     ${account}     Create Dictionary
#     ...    name=Henrique Araujo
#     ...    email=henrique@teste.com.br
#     ...    cpf=${EMPTY}


#     submit signup form    ${account}
#     Notice should be     Por favor, informe o seu CPF


# Email no formato incorreto

#     ${account}     Create Dictionary
#     ...     name=Henrique Araujo
#     ...     email=henrique*teste.com.br
#     ...     cpf=15478541542


#     submit signup form    ${account}
#     Notice should be    Oops! O email informado é inválido


# CPF no formato incorreto
#     [Tags]    required

#     ${account}     Create Dictionary
#     ...     name=Henrique Araujo
#     ...     email=henrique@teste.com.br
#     ...     cpf=154785415ab

#     submit signup form    ${account}
#     Notice should be   Oops! O CPF informado é inválido


# Tests templates


Tentativa de pré-cadastro
    [Template]        Attempt signup
    ${EMPTY}           henrique@gmail.com    25478565441    Por favor informe o seu nome completo
    Henrique Araujo    ${EMPTY}              25485652441    Por favor, informe o seu melhor e-mail
    Henrique Araujo    henrique@gmail.com    ${EMPTY}       Por favor, informe o seu CPF
    Henrique Araujo    henrique*gmail.com    54852145852    Oops! O email informado é inválido
    Henrique Araujo    henrique&gmail.com    54852145852    Oops! O email informado é inválido
    Henrique Araujo    www.teste.com.br      54852145852    Oops! O email informado é inválido
    Henrique Araujo    HHHHJJJJJJHH          54852145852    Oops! O email informado é inválido
    Henrique Araujo    kkjjgjkmvj*jjh*jj^    54852145852    Oops! O email informado é inválido
    Henrique Araujo    123544                54852145852    Oops! O email informado é inválido
    Henrique Araujo    henrique@gmail.com    5485214585d    Oops! O CPF informado é inválido
    Henrique Araujo    henrique@gmail.com    1              Oops! O CPF informado é inválido
    Henrique Araujo    henrique@gmail.com    39831866011    Oops! O CPF informado é inválido
    Henrique Araujo    henrique@gmail.com    5485214585     Oops! O CPF informado é inválido
    Henrique Araujo    henrique@gmail.com    hjgdhgdhd      Oops! O CPF informado é inválido
    Henrique Araujo    henrique@gmail.com    ^~&&**jh       Oops! O CPF informado é inválido
*** Keywords ***
Attempt signup
    [Arguments]     ${name}    ${email}    ${cpf}    ${output_message}


    ${account}     Create Dictionary
    ...     name=${name}
    ...     email=${email}
    ...     cpf=${cpf}

    submit signup form    ${account}
    Notice should be   ${output_message}


