*** Settings ***
Documentation       Cenarios de pre-cadatro de clientes

Library           Browser
Library           libs/Account.py

Resource          pages/landing.resource
Resource          pages/welcome.resource

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000
