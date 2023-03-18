*** Settings ***
Library    SeleniumLibrary
Variables    ./locators.py

*** Variables ***
${TIMEOUT}    60

*** Keywords ***
Login
    [Arguments]    ${vURL}    ${vBrowser}
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le navigateur en precisant l'URL et le navigateur
    Open Browser    ${vURL}    ${vBrowser}
    # Maximiser la fenetre du navigateur
    Maximize Browser Window
################################### Exercice 1 ##########################################################################
Cliquer sur les liens My Account et Register respectivement pour arriver sur la page Register Account
    # Cliquer sur le lien My Account
    Wait Until Element Is Visible    ${lst_MyAccount}
    Click Element    ${lst_MyAccount}
    # Cliquer sur le lien Register
    Wait Until Element Is Visible    ${opt_Register}
    Click Link    ${opt_Register}
    # Attendre que la page Register Account s'affiche
    Wait Until Element Is Visible    ${lbl_RegisterAccount}
Saisir les champs dans la page Register Account avec les données valides
    [Arguments]    ${val_FirstName}    ${val_LastName}    ${val_email}    ${val_telephone}   ${val_password} 
    Input Text    ${txt_FirstName}    ${val_FirstName}
    Input Text    ${txt_LastName}    ${val_LastName}
    Input Text    ${txt_email}    ${val_email}
    Input Text    ${txt_telephone}    ${val_telephone}
    Input Password    ${txt_password}    ${val_password}
    Input Password    ${txt_confirmPassword}    ${val_password}    
Cocher le checkbox Privacy Policy et cliquer le bouton Continue
    Page Should Contain Checkbox    ${chk_PrivacyPolicy}
    Select Checkbox    ${chk_PrivacyPolicy}
    Click Element    ${btn_Continue}
    Wait Until Element Is Visible    ${lbl_AccountCreated}
Critère de succès: La page Account Created s'affiche
    Page Should Contain Element    ${lbl_AccountCreated}
Postcondition: Se déconnecter de la page Account Created
    Click Element    ${lst_MyAccount}
    Wait Until Element Is Visible    ${opt_Logout}
    Click Element    ${opt_Logout}
    Page Should Contain Element    ${lbl_AccountLogout}
############################# Exercice 2 ###############################################
Saisir les champs dans la page Register Account avec les données valides Exercice 2
    [Arguments]    ${v_FirstName}    ${v_LastName}    ${v_email}    ${v_telephone}   ${v_password} 
    Input Text    ${txt_FirstName}    ${v_FirstName}
    Input Text    ${txt_LastName}    ${v_LastName}
    Input Text    ${txt_email}    ${v_email}
    Input Text    ${txt_telephone}    ${v_telephone}
    Input Password    ${txt_password}    ${v_password}
    Input Password    ${txt_confirmPassword}    ${v_password}
Cocher le bouton radio Yes pour opter l'abonnement Newsletter
    [Arguments]    ${rb_groupName}    ${rb_value}
    Wait Until Element Is Visible    ${lbl_YesNewsletter}
    Select Radio Button    ${rb_groupName}    ${rb_value}
Critère de succès: le bouton radio Yes est cochée
    [Arguments]    ${rb_groupName}    ${rb_value}
    Wait Until Element Is Visible    ${lbl_YesNewsletter}
    Radio Button Should Be Set To    ${rb_groupName}    ${rb_value}
############################## Exercice 3 ###############################################
Saisir les champs dans la page Register Account avec les données déjà enregistrées
    [Arguments]    ${val1_FirstName}    ${val1_LastName}    ${val1_email}    ${val1_telephone}    ${val_password}
    Input Text    ${txt_FirstName}    ${val1_FirstName}
    Input Text    ${txt_LastName}    ${val1_LastName}
    Input Text    ${txt_email}    ${val1_email}
    Input Text    ${txt_telephone}    ${val1_telephone}
    Input Password    ${txt_password}    ${val_password}
    Input Password    ${txt_confirmPassword}    ${val_password}    
Critère de succès: Message d'erreur s'affiche
    Wait Until Element Is Visible    ${lbl_messageErreur}
    Page Should Contain Element    ${lbl_messageErreur}
############################# Exercice 4 ##############################################
Cliquer sur les liens My Account et Login respectivement pour arriver sur la page Login
    # Cliquer sur le lien My Account
    Wait Until Element Is Visible    ${lst_MyAccount}
    Click Element    ${lst_MyAccount}
    # Cliquer sur le lien Login
    Wait Until Element Is Visible    ${opt_Login}
    Click Link    ${opt_Login}
    # Attendre que la page Login s'affiche
    Wait Until Element Is Visible    ${lbl_LoginAccount}
Saisir les champs dans la page Login Account avec les données valides
    [Arguments]    ${val1_email}    ${val_password}
    Input Text    ${txt_email}    ${val1_email}
    Input Password    ${txt_password}    ${val_password}
Cliquer sur le bouton Login
    Wait Until Element Is Visible    ${btn_Login}
    Click Element    ${btn_Login}
Critère de succès: La page du compte utilisateur s'affiche
    Wait Until Element Is Visible    ${lbl_MyAccount}
    Page Should Contain Element    ${lbl_MyAccount}    
Postcondition: Se déconnecter de la page du compte utilisateur
    Click Element    ${lst_MyAccount}
    Wait Until Element Is Visible    ${opt_Logout}
    Click Element    ${opt_Logout}
    Page Should Contain Element    ${lbl_AccountLogout}
###################################### Exercice 5 ######################################
Cliquer sur le lien Forgotten Password
    Wait Until Element Is Visible    ${lnk_ForgottenPassword}
    Click Element    ${lnk_ForgottenPassword}
    Wait Until Page Contains Element    ${lbl_pageForgottenPassword}    
Saisir l'adresse courriel précédente et cliquer sur le bouton Continue
    [Arguments]    ${val1_email}    
    Input Text    ${txt_email}    ${val1_email}
    Click Element    ${btn_Continue}    
Critère de succès: le message d'envoi de la confirmation s'affiche
    [Arguments]    ${message}
    Wait Until Element Is Visible    ${lbl_messageConfirmation}
    Page Should Contain    ${message}
################################### Exercice 6 #########################################
Chercher le produit sur le champ de recherche
    [Arguments]    ${val_search}
    Input Text    ${txt_Search}    ${val_search}
    Wait Until Element Is Visible    ${btn_Search}
    Click Button    ${btn_Search}
Critère de succès: la page du produit recherché s'affiche
    [Arguments]    ${val_search}
    Wait Until Element Is Visible    ${lbl_PageProduitRecherche_p1}${val_search}${lbl_PageProduitRecherche_p2}
    Page Should Contain Element    ${lbl_PageProduitRecherche_p1}${val_search}${lbl_PageProduitRecherche_p2}
    Page Should Contain    Search - ${val_search}
################################### Exercice 7 a ###########################################
La page du produit recherché s'affiche
    [Arguments]    ${val_search}
    Wait Until Element Is Visible    ${lbl_PageProduitRecherche_p1}${val_search}${lbl_PageProduitRecherche_p2}
    Page Should Contain    Search - ${val_search}
Ajouter le produit au panier
    [Arguments]    ${val_produit}
    Wait Until Element Is Visible    ${lbl_produit_p1}${val_produit}${lbl_produit_p2}
    Click Element    ${lnk_ajouterPanier_p1}${val_produit}${lnk_ajouterPanier_p2}    
Ouvrir l'onglet Panier et cliquer sur le lien Checkout
    [Arguments]    ${val_produit}
    Wait Until Element Is Visible    ${btn_Panier}
    # on ajoute sleep, sinon le système ne procède pas vers le panier. Même avec les wait.
    Sleep    1
    Click Element    ${btn_Panier}
    Wait Until Element Is Visible    ${lbl_produitDansLOnglet_p1}${val_produit}${lbl_produitDansLOnglet_p2}
    Click Element    ${lnk_checkout}
Critère de succès: le message d'indisponibilité du produit s'affiche
    [Arguments]    ${val_messageAbsenceDuProduit}
    Wait Until Element Is Visible    ${lbl_messageAbsenceDuProduit}
    Page Should Contain Element    ${lbl_messageAbsenceDuProduit}
    Page Should Contain    ${val_messageAbsenceDuProduit}
#################################### Exercice 7 b ##########################################################
Saisir le produit avec le nom invalide sur le champ de recherche    
    [Arguments]    ${val_search_Invalide}
    Input Text    ${txt_Search}    ${val_search_Invalide}
Cliquer sur le bouton recherche
    Wait Until Element Is Visible    ${btn_Search}
    Click Button    ${btn_Search}
Critère de succès: le message d'indisponibilité s'affiche 
    [Arguments]    ${val_messageNoAvailable}
    Wait Until Element Is Visible    ${lbl_NoProductAvailable}
    Page Should Contain    ${val_messageNoAvailable}
################################### Exercice 8 ######################################################
Chercher le premier produit sur le champ de recherche et l'ajouter au panier
    [Arguments]    ${val8_search}    ${val8_produit}
    Input Text    ${txt_Search}    ${val8_search}
    Wait Until Element Is Visible    ${btn_Search}
    Click Button    ${btn_Search}
    Wait Until Element Is Visible    ${lbl_PageProduitRecherche_p1}${val8_search}${lbl_PageProduitRecherche_p2}
    Page Should Contain    Search - ${val8_search}
    Wait Until Element Is Visible    ${lbl_produit_p1}${val8_produit}${lbl_produit_p2}
    Click Element    ${lnk_ajouterPanier_p1}${val8_produit}${lnk_ajouterPanier_p2} 
Chercher le deuxième produit sur le champ de recherche et l'ajouter au panier    
    [Arguments]     ${val9_search}    ${val9_produit}
    Input Text    ${txt_Search}    ${val9_search}
    Wait Until Element Is Visible    ${btn_Search}
    Click Button    ${btn_Search}
    Page Should Contain    Search - ${val9_search}
    Wait Until Element Is Visible    ${lbl_produit_p1}${val9_produit}${lbl_produit_p2}
    Click Element    ${lnk_ajouterPanier_p1}${val9_produit}${lnk_ajouterPanier_p2}
    Wait Until Element Is Visible    ${btn_addToCart} 
    Click Element    ${btn_addToCart}
Procéder avec Checkout
    [Arguments]    ${val8_produit}
    Wait Until Element Is Visible    ${btn_Panier}
    # on ajoute sleep, sinon le système ne procède pas vers le panier. Même avec les wait.
    Sleep    1
    Click Element    ${btn_Panier}
    Wait Until Element Is Visible    ${lbl_produitDansLOnglet_p1}${val8_produit}${lbl_produitDansLOnglet_p2}
    Click Element    ${lnk_checkout}
Remplir la section Step 2 avec les les données valides
    [Arguments]    ${val1_FirstName}    ${val1_LastName}    ${val_adresse1}    ${val_city}    ${val_postcode}    ${val_country}    ${val_region}
    # il faut donner un sleep de 1 sec. pour que le système prépare à Get Element Count. Sinon ça ne marchera pas, même on utilise les wait
    Sleep    1
    # on ajoute IF dans le cas lorsque l'addrese est déjà enregistré (dans les cas lorsque on repète la même cas de test plusieures fois et l'addresse est déjà là)
    ${count}    Get Element Count    ${rb_existingAddress}
    IF    ${count} > 0
        Wait Until Element Is Visible    ${btn_continue_step2}
        Click Element    ${btn_continue_step2}           
    ELSE  
        Wait Until Element Is Visible    ${lbl_checkout}
        Sleep    1
        Scroll Element Into View    ${btn_continue_step2}
        Input Text    ${txt_checkout_firstName}    ${val1_FirstName}
        Input Text    ${txt_checkout_lastName}    ${val1_LastName}
        Input Text    ${txt_checkout_address1}    ${val_adresse1}
        Input Text    ${txt_checkout_city}    ${val_city}
        Input Text    ${txt_checkout_postcode}    ${val_postcode}
        Page Should Contain List    ${lst_checkout_country}
        Select From List By Label    ${lst_checkout_country}    ${val_country}
        Wait Until Element Is Enabled    ${lst_checkout_region}
        # on ajoute sleep, sinon le système ne procède pas avec la liste déroulante. Même avec les wait.
        Sleep    1
        Page Should Contain List    ${lst_checkout_region}   
        Select From List By Label    ${lst_checkout_region}    ${val_region} 
        Click Element    ${btn_continue_step2}
    END
Remplir la section Step 3 avec les les données valides
    Wait Until Element Is Visible    ${rb_step3}
    Page Should Contain Radio Button    ${rb_step3}
    Select Radio Button    shipping_address    existing
    Wait Until Element Is Visible    ${btn_continue_step3}
    Click Element    ${btn_continue_step3}
Procéder avec Steps 4, 5 et 6
    Wait Until Element Is Visible    ${btn_continue_step4}
    Click Element    ${btn_continue_step4}
    # on ajoute sleep, sinon le système ne procède pas vers le step 5. Même avec les wait.
    Sleep    1
    Wait Until Element Is Visible    ${chk_step5}
    Page Should Contain Checkbox    ${chk_step5}
    Select Checkbox    ${chk_step5}
    Wait Until Element Is Visible    ${btn_continue_step5}
    Click Element    ${btn_continue_step5}
    # il faut donner un sleep de 1 sec. pour que le système prépare à Get Element Count. Sinon ça ne marchera pas, même on utilise les wait
    Sleep    1
    # Très souvent le système est bogué et à la fin de Step 6 renvoie l'utilisateur à Step 2. 
    # On met un IF ici pour éviter cette situation lorsque le système marche bien.
    ${mount}    Get Element Count    //td[text()='Product Name']
    IF    ${mount} > 0
        Wait Until Element Is Visible    ${btn_confirm_step6}
        Click Element    ${btn_confirm_step6} 
    END    
    # il faut donner un sleep de 1 sec. pour que le système prépare à Get Element Count. Sinon ça ne marchera pas, même on utilise les wait
    Sleep    1
    # Très souvent le système est bogué et à la fin de Step 6 renvoie l'utilisateur à Step 2. 
    # On met un IF ici pour éviter cette situation lorsque le système renvoie l'utilisateur à Step 2. 
    ${count}    Get Element Count    ${rb_existingAddress}
    IF    ${count} > 0
        Wait Until Element Is Visible    ${btn_continue_step2}
        Click Element    ${btn_continue_step2} 
        ## vers le step 3
        Wait Until Element Is Visible    ${rb_step3}
        Page Should Contain Radio Button    ${rb_step3}
        Select Radio Button    shipping_address    existing
        Wait Until Element Is Visible    ${btn_continue_step3}
        Click Element    ${btn_continue_step3}
        ##    vers le step 4
        Wait Until Element Is Visible    ${btn_continue_step4}
        Click Element    ${btn_continue_step4}
        # on ajoute sleep, sinon le système ne procède pas vers le step 5. Même avec les wait.
        Sleep    1
        ## vers le step 5
        Wait Until Element Is Visible    ${chk_step5}
        Page Should Contain Checkbox    ${chk_step5}
        Select Checkbox    ${chk_step5}
        Wait Until Element Is Visible    ${btn_continue_step5}
        Click Element    ${btn_continue_step5}
        ## vers le step 6
        Wait Until Element Is Visible    ${btn_confirm_step6}
        Click Element    ${btn_confirm_step6}
    END
    # il faut donner un sleep de 1 sec. pour que le système prépare à Get Element Count. Sinon ça ne marchera pas, même on utilise les wait
    Sleep    1
    # on met IF ici juste pour ne pas répéter la même commande qu'on a mise avant (dans les lignes 235-236)
    ${mount}    Get Element Count    //td[text()='Product Name']
    IF    ${mount} > 0
        Wait Until Element Is Visible    ${btn_confirm_step6}
        Click Element    ${btn_confirm_step6} 
    END    
Critère de succès: La page avec la confirmation de la commande passée s'ouvre
    [Arguments]    ${val_messageConfirmation}
    Wait Until Element Is Visible    ${lbl_orderPlaced}
    Page Should Contain    ${val_messageConfirmation}
    
    
    
    
    