*** Settings ***
Documentation       Teste para slogan

Library           Browser

*** Test Cases ***
Deve exibir o slogan na landing page
    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000
    Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui!

    
    