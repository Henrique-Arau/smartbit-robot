*** Settings ***
Documentation        Arquivo principal do projeto Robot

Library        Browser
Library        libs/Account.py

Resource        pages/Landing.resource
Resource        pages/Welcome.resource


*** Keywords ***

start session

    New Browser  browser=chromium    headless=False
    New Page     http://localhost:3000
