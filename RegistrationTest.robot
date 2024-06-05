*** Settings ***

Library    SeleniumLibrary


*** Test Cases ***

Valid Register Test
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmeliaaaa627@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda123456
    Input Text    name=customer[password_confirmation]    Amanda123456
    Scroll Element Into View  css:.btn-gray.btn-full
   

Invalid Register Leaves all field blank
    Open Browser    https://thermos.com/account/register    Chrome
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors

Invalid Register fill in all columns with valid data but leave names blank
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors  

Invalid Register fill in all columns with valid data but leave email blank
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors  

Invalid Register fill in all columns with valid data but leave phone blank
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors

Invalid Register fill in all columns with valid data but leave password blank
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors  

Invalid Register fill in all columns with valid data but leave password confirmation blank
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but email has no @
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmeliagmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but email has no domain
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but email has no username
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    @gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but email has space between username and domain
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia @gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors

Invalid Register fill in all columns with valid data but email has special character in domain
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gma##il.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but phone number is a text
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    testnumberwithtext
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors  

Invalid Register fill in all columns with valid data but phone number contain special character
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    0897#@!&4763
    Input Text    id=CreatePassword    Amanda12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but password than 8 character
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    aman
    Input Text    name=customer[password_confirmation]    aman
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but password missing number
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amandaaaa
    Input Text    name=customer[password_confirmation]    Amandaaaa
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but password capital letter
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    amanda12345
    Input Text    name=customer[password_confirmation]    amandaa12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but password missing number and capital letter
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    amandaamelia
    Input Text    name=customer[password_confirmation]    amandaamelia
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but password has a space
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amanda 12345
    Input Text    name=customer[password_confirmation]    Amanda12345
    Click Button  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

Invalid Register fill in all columns with valid data but password and password confirmation is missmatch
    Open Browser    https://thermos.com/account/register    Chrome
    Input Text    id=FirstName    Amanda Amelia
    Input Text    id=Email    AmandaAmelia@gmail.com
    Input Text    id=Phone    089726384763
    Input Text    id=CreatePassword    Amelia9876
    Input Text    name=customer[password_confirmation]    Amanda12345
    Press Keys  css:.btn-gray.btn-full
    Element Should Be Visible  css=.errors 

    


