*** Settings ***
Documentation       Cenarios de pre-cadatro de clientes

Library           Browser

*** Keywords ***
Submit signup form

    [Arguments]    ${account}

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=cpf    ${account}[cpf]

    Click    css=button >> text=Cadastrar

Notice should be
    [Arguments]    ${message}

    ${element}    Set Variable     css=form .notice
    Wait For Elements State    
    ...    ${element}
    ...    visible    5

    Get Text    ${element}    equal    ${message}