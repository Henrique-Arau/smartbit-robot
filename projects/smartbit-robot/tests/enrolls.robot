*** Settings ***

Documentation       Suite de testes de adesões de plano

Resource            ../resources/Base.resource

Test Setup          start session
Test Teardown       Take Screenshot



*** Test Cases ***

Deve poder realizar uma nova adesao

    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

    Go to erolls
    Go to enroll form





*** Keywords ***

Go to erolls
    Click      css=a[href="/memberships"]

    Wait For Elements State      css=h1 >> text=Matrículas
    ...         visible         5

Go to enroll form

    Click  css=a[href="/memberships/new"]

    Wait For Elements State      css=h1 >> text=Nova matrícula
    ...         visible         5

    Sleep     5