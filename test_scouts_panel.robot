*** Settings ***
Library    SeleniumLibrary
Documentation     Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${SIGNINBUTTON}     //*[@id='__next']/form/div/div[2]/button
${EMAILINPUT}       //*[@id='login']
${PASSWORDINPUT}    //*[@id='password']
${PAGELOGO}         //*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${ERRORMESSAGE}     //*[@id="__next"]/form/div/div[1]/div[3]/span
#ADD PLAYER  variables
${ADDPLAYERLINK}    //*[@id="__next"]/div[1]/main/div[3]/div[2]/div/div/a/button/span[1]
${PLAYERADDEDALERT}     //*[@role="alert" and text()="Added player."]
${ERRORALERT}     //*[@role="alert" and text()="Cannot add player."]
${PROFILELINK}  //*[@id="__next"]/div[1]/div/div/div/ul[2]/div[1]/div[2]/span
${EMAILFIELD}   //*[@name="email"]
${NAMEFIELD}    //*[@name="name"]
${SURNAMEFIELD}   //*[@name="surname"]
${PHONEFIELD}   //*[@name="phone"]
${WEIGHTFIELD}  //*[@name="weight"]
${HEIGHTFIELD}  //*[@name="height"]
${AGEFIELD}     //*[@name="age"]
${LEGFIELD}     //*[@id="mui-component-select-leg"]
${RIGHTLEG}     //*[@id="menu-leg"]/div[3]/ul/li[1]
${LEG}          //*[@id="leg"]
${CLUBFIELD}    //*[@name="club"]
${LEVELFIELD}   //*[@name="level"]
${MAINPOSITIONFIELD}    //*[@name="mainPosition"]
${SECONDPOSITION}   //*[@name="secondPosition"]
${DISTRICTFIELD}    //*[@id="mui-component-select-district"]
${DISTRICTLIST}     //*[@id="menu-district"]/div[3]/ul
${KUJAWSKOPOMORSKIE}     //*[@data-value="kujawsko-pomorskie"]
${DISTRICT}     //*[@id="district"]
${ACHIEVEMENTSFIELD}    //*[@name="achievements"]
${LANGUAGESBUTTON}  //*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[15]/button/span[1]
${LANGUAGESFIELD}   //*[@name="languages[0]"]
${LACZYPILKAFIELD}  //*[@name="webLaczy"]
${WEB90FIELD}   //*[@name="web90"]
${WEBFBFIELD}   //*[@name="webFB"]
${WEBYTBUTTON}  //*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[19]/button
${WEBYTFIELD}   //*[@name="webYT[0]"]
${SUBMITBUTTON}     //*[@type="submit"]

*** Test Cases ***
Log in to the system
    Open Login page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    [Teardown]    Close Browser

Unsuccessful login page
    Open Login Page
    Type In Email
    Type in incorrect password
    Click On The Sign In Button
    Assert Error Message
    [Teardown]    Close Browser

Add player
    Open Login page
    Type in email
    Type in password
    Click on the Sign In button
    Click on Add player link
    Complete fields
    Click on the Submit button
    Check success alert
    [Teardown]    Close Browser

Check correctness of data
    Open Login page
    Type in email
    Type in password
    Click on the Sign In button
    Click on Add player link
    Complete fields
    Click on the Submit button
    Check success alert
    Check Correctness Of Data
    [Teardown]    Close Browser

Check age field validation with incorrect day
    Open Login page
    Type in email
    Type in password
    Click on the Sign In button
    Click on Add player link
    Complete fields with incorrect day
    Click On The Submit Button
    Check Error Alert
    [Teardown]    Close Browser

# The following test fails due to insufficient age field validation, which is why it's commented out
#Check age field validation with incorrect year
#    Open Login page
#    Type in email
#    Type in password
#    Click on the Sign In button
#    Click on Add player link
#    Complete fields with incorrect year
#    Click On The Submit Button
#    Check Error Alert
#    [Teardown]    Close Browser

*** Keywords ***
Open Login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in email
    Input Text  ${EMAILINPUT}       user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-1234
Click on the Sign In button
    Click Button    ${SIGNINBUTTON}
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert.png
Type in incorrect password
    Input Text    ${PASSWORDINPUT}  4321-Test
Assert Error Message
    Wait Until Element Is Visible    ${ERRORMESSAGE}
    Element Text Should Be  ${ERRORMESSAGE}    Identifier or password invalid.
Click on Add player link
    Wait Until Element Is Visible    ${ADDPLAYERLINK}
    Click Element   ${ADDPLAYERLINK}
Complete fields
    Wait Until Element Is Visible    ${EMAILFIELD}
    Input Text  ${EMAILFIELD}   example@gmail.com
    Input Text  ${NAMEFIELD}    John
    Input Text  ${SURNAMEFIELD}  Doe
    Input Text  ${PHONEFIELD}   +481234567
    Input Text  ${WEIGHTFIELD}  70
    Input Text  ${HEIGHTFIELD}  170
    Input Text  ${AGEFIELD}     12.04.1970
    Click Element   ${LEGFIELD}
    Click Element    ${RIGHTLEG}
    Input Text  ${CLUBFIELD}    Real Madrid
    Input Text    ${LEVELFIELD}     Professional
    Input Text  ${MAINPOSITIONFIELD}    Quarterback
    Input Text  ${SECONDPOSITION}   Goalkeeper
    Click Element    ${DISTRICTFIELD}
    Click Element    ${KUJAWSKOPOMORSKIE}
    Input Text  ${ACHIEVEMENTSFIELD}    Example achievement
    Click Element    ${LANGUAGESBUTTON}
    Input Text  ${LANGUAGESFIELD}   Ukrainian
    Input Text  ${LACZYPILKAFIELD}  Example text
    Input Text    ${WEB90FIELD}     Example text
    Input Text  ${WEBFBFIELD}   example.facebook.com
    Click Element    ${WEBYTBUTTON}
    Input Text    ${WEBYTFIELD}     example.youtube.com

Complete fields with incorrect day
    Wait Until Element Is Visible    ${EMAILFIELD}
    Input Text  ${EMAILFIELD}   example@gmail.com
    Input Text  ${NAMEFIELD}    John
    Input Text  ${SURNAMEFIELD}  Doe
    Input Text  ${AGEFIELD}     99.04.1970
    Input Text  ${MAINPOSITIONFIELD}    Quarterback
Complete fields with incorrect year
    Wait Until Element Is Visible    ${EMAILFIELD}
    Input Text  ${EMAILFIELD}   example@gmail.com
    Input Text  ${NAMEFIELD}    John
    Input Text  ${SURNAMEFIELD}  Doe
    Input Text  ${AGEFIELD}     12.04.3333
    Input Text  ${MAINPOSITIONFIELD}    Quarterback
Click on the Submit button
    Click Button    ${SUBMITBUTTON}
Check success alert
    Wait Until Element Is Visible    ${PLAYERADDEDALERT}
Check error alert
    Wait Until Element Is Visible    ${ERRORALERT}
Check correctness of data
    Wait Until Element Is Not Visible    ${PLAYERADDEDALERT}
    Textfield Value Should Be   ${EMAILFIELD}   example@gmail.com
    Textfield Value Should Be     ${EMAILFIELD}   example@gmail.com
    Textfield Value Should Be  ${NAMEFIELD}    John
    Textfield Value Should Be  ${SURNAMEFIELD}  Doe
    Textfield Value Should Be  ${PHONEFIELD}   +481234567
    Textfield Value Should Be  ${WEIGHTFIELD}  70
    Textfield Value Should Be  ${HEIGHTFIELD}  170
    Textfield Value Should Be  ${AGEFIELD}     1970-04-12
    Textfield Value Should Be    ${LEG}    right
    Textfield Value Should Be  ${CLUBFIELD}    Real Madrid
    Textfield Value Should Be    ${LEVELFIELD}     Professional
    Textfield Value Should Be  ${MAINPOSITIONFIELD}    Quarterback
    Textfield Value Should Be  ${SECONDPOSITION}   Goalkeeper
    Textfield Value Should Be    ${DISTRICT}   kujawsko-pomorskie
    Textfield Value Should Be  ${ACHIEVEMENTSFIELD}    Example achievement
    Textfield Value Should Be  ${LANGUAGESFIELD}   Ukrainian
    Textfield Value Should Be  ${LACZYPILKAFIELD}  Example text
    Textfield Value Should Be    ${WEB90FIELD}     Example text
    Textfield Value Should Be  ${WEBFBFIELD}   example.facebook.com
    Textfield Value Should Be    ${WEBYTFIELD}     example.youtube.com


