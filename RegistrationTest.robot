*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${REGISTER_URL}   https://thermos.com/account/register
${BROWSER}        Chrome
${COOKIE_BANNER}  css:.osano-cm-window__dialog .osano-cm-dialog__close
${REGISTER_BUTTON}    css:.btn-gray.btn-full
${HOME_URL}       https://thermos.com/
${ERROR_MESSAGE}  css:.errors


*** Keywords ***
Handle Cookie Banner
    [Documentation]    Menangani banner cookie jika ada
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${COOKIE_BANNER}    timeout=5s
    ${banner_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${COOKIE_BANNER}
    IF    ${banner_visible}
        Click Button    ${COOKIE_BANNER}
        Sleep    1s
    END

Click on Register Button
    [Documentation]    Klik button register 
    Handle Cookie Banner
    Scroll Element Into View  ${REGISTER_BUTTON}
    Click Button    ${REGISTER_BUTTON}


*** Test Cases ***
Valid Register Test
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmeliaaa60x7@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda123456
    Input Text    name=customer[password_confirmation]    Amanda123456
    Click on Register Button
    Wait Until Location Is    ${HOME_URL}    timeout=10s
    Location Should Be    ${HOME_URL}
   

Invalid Register Leaves all field blank
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Click on Register Button
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=10s
    Element Should Be Visible    ${ERROR_MESSAGE}

Invalid Register fill in all columns with valid data but leave names blank
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=Email    AmandaAmelihshsa@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button
    Location Should Be    ${REGISTER_URL}  

Invalid Register fill in all columns with valid data but leave email blank
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=10s
    Element Should Be Visible    ${ERROR_MESSAGE} 
    Location Should Be    ${REGISTER_URL} 

Invalid Register fill in all columns with valid data but leave phone blank
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAbmelia826@gmail.com
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=10s
    Element Should Be Visible    ${ERROR_MESSAGE}
    Location Should Be    ${REGISTER_URL}

Invalid Register fill in all columns with valid data but leave password blank
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmeliavs48@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button
    Handle Alert
    Location Should Be    ${REGISTER_URL}
  

Invalid Register fill in all columns with valid data but leave password confirmation blank
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Click on Register Button
    Handle Alert
    Location Should Be    ${REGISTER_URL} 

Invalid Register fill in all columns with valid data but email has no @
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmeliagmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button 
    Location Should Be    ${REGISTER_URL}

Invalid Register fill in all columns with valid data but email has no domain
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button 
    Location Should Be    ${REGISTER_URL} 

Invalid Register fill in all columns with valid data but email has no username
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    @gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button 
    Location Should Be    ${REGISTER_URL} 
 

Invalid Register fill in all columns with valid data but email has space between username and domain
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia @gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button 
    Location Should Be    ${REGISTER_URL}

Invalid Register fill in all columns with valid data but email has special character in domain
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gma##il.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button
    Location Should Be    ${REGISTER_URL} 

Invalid Register fill in all columns with valid data but phone number is a text
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmanadaAmeliaahgsy@gmail.com
    Input Text    id=Phone    testnumberwithtex
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button 
    Location Should Be    ${REGISTER_URL}  

Invalid Register fill in all columns with valid data but phone number contain special character
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmahdjelia@gmail.com
    Input Text    id=Phone    0897#@!&4763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button 
    Location Should Be    ${REGISTER_URL} 

Invalid Register fill in all columns with valid data but password than 8 character
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandahgAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    ama
    Input Text    name=customer[password_confirmation]    ama
    Click on Register Button
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    timeout=10s 

Invalid Register fill in all columns with valid data but password missing number
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmaajsndaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amandaaaa
    Input Text    name=customer[password_confirmation]    Amandaaaa
    Click on Register Button 
    Location Should Be    ${REGISTER_URL} 

Invalid Register fill in all columns with valid data but password capital letter
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmanahsdaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    amandaa12345
    Input Text    name=customer[password_confirmation]    amandaa12345
    Click on Register Button 
    Location Should Be    ${REGISTER_URL} 

Invalid Register fill in all columns with valid data but password missing number and capital letter
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAahsmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    amandaamelia
    Input Text    name=customer[password_confirmation]    amandaamelia
    Click on Register Button 
    Location Should Be    ${REGISTER_URL}

Invalid Register fill in all columns with valid data but password has a space
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmahandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda 12345
    Input Text    name=customer[password_confirmation]    Amanda 12345
    Click on Register Button 
    Location Should Be    ${REGISTER_URL} 

Invalid Register fill in all columns with valid data but password and password confirmation is missmatch
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmahelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amelia9876
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click on Register Button 
    Handle Alert
    Location Should Be    ${REGISTER_URL}