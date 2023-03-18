*** Settings ***
Resource    ../Resources/keywords.robot
Variables    ../Resources/locators.py
Test Setup    Login    ${vURL}    ${vBrowser}
Test Teardown    Close All Browsers

*** Variables ***
${vURL}    http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}    chrome
# Exercice 1
${val_FirstName}    William
${val_LastName}    Graham
${val_email}    williamgraham@gmail.com
${val_telephone}    514-514-5141
${val_password}    1234567
# Exercice 2
${v_FirstName}    George
${v_LastName}    Town
${v_email}    georgetown@gmail.com
${v_telephone}    514-514-1234
${v_password}    1234567
${rb_groupName}    newsletter
${rb_value}    1
# Exercice 3
${val1_FirstName}    ${val_FirstName}
${val1_LastName}    ${val_LastName}
${val1_email}    ${val_email}
${val1_telephone}    ${val_telephone}
# Exercice 5
${message}    An email with a confirmation link has been sent your email address.
# Exercice 6
${val_search}    Samsung
# Exercice 7a
${val_produit}    Samsung SyncMaster 941BW
${val_messageAbsenceDuProduit}    Products marked with *** are not available in the desired quantity or not in stock!
# Exercice 7b
${val_search_Invalide}      samsungwww
${val_search_Invalide}      888
${val_messageNoAvailable}    There is no product that matches the search criteria.
#Exercice 8
${val8_search}    iPod
${val8_produit}    iPod Nano
${val9_search}    HP    
${val9_produit}    HP LP3065
${val_adresse1}    439, Robert-Albert street
${val_city}        Toronto
${val_postcode}    G7P 7H3
${val_country}    Canada
${val_region}    Ontario
${val_messageConfirmation}    Your order has been placed!

*** Test Cases ***
Exercice 1: L'utilisateur peut s'inscrire dans l'application en fournissant tous les champs
    [Documentation]    Test case pour verifier que l'utilisateur peut s'inscrire dans l'application en fournissant tous les champs
    Cliquer sur les liens My Account et Register respectivement pour arriver sur la page Register Account
    Saisir les champs dans la page Register Account avec les données valides    ${val_FirstName}    ${val_LastName}    ${val_email}    ${val_telephone}    ${val_password}
    Cocher le checkbox Privacy Policy et cliquer le bouton Continue
    Critère de succès: La page Account Created s'affiche 
    Postcondition: Se déconnecter de la page Account Created        
Exercice 2: L'utilisateur peut s'inscrire à l'application en optant pour l'abonnement à la Newsletter
    [Documentation]    Test case pour verifier que l'utilisateur peut s'inscrire à l'application en optant pour l'abonnement à la Newsletter
    Cliquer sur les liens My Account et Register respectivement pour arriver sur la page Register Account
    Saisir les champs dans la page Register Account avec les données valides Exercice 2   ${v_FirstName}    ${v_LastName}    ${v_email}    ${v_telephone}    ${v_password}
    Cocher le bouton radio Yes pour opter l'abonnement Newsletter    ${rb_groupName}    ${rb_value}
    Critère de succès: le bouton radio Yes est cochée    ${rb_groupName}    ${rb_value}
    Cocher le checkbox Privacy Policy et cliquer le bouton Continue
    Postcondition: Se déconnecter de la page Account Created
Exercice 3: L'utilisateur ne peut pas enregistrer un compte en double
    [Documentation]     Test case pour verifier que l'utilisateur ne peut pas enregistrer un compte en double
    Cliquer sur les liens My Account et Register respectivement pour arriver sur la page Register Account
    Saisir les champs dans la page Register Account avec les données déjà enregistrées    ${val1_FirstName}    ${val1_LastName}    ${val1_email}    ${val1_telephone}    ${val_password}
    Cocher le checkbox Privacy Policy et cliquer le bouton Continue
    Critère de succès: Message d'erreur s'affiche
Exercice 4: L'utilisateur peut se connecter avec des informations d'identification valides 
    [Documentation]    Test case pour verifier que l'utilisateur peut se connecter avec des informations d'identification valides
    Cliquer sur les liens My Account et Login respectivement pour arriver sur la page Login
    Saisir les champs dans la page Login Account avec les données valides    ${val1_email}    ${val_password}
    Cliquer sur le bouton Login
    Critère de succès: La page du compte utilisateur s'affiche 
    Postcondition: Se déconnecter de la page du compte utilisateur
Exercice 5: L'utilisateur est en mesure de réinitialiser le mot de passe oublié
    [Documentation]    Test case pour verifier que l'utilisateur est en mesure de réinitialiser le mot de passe oublié
    Cliquer sur les liens My Account et Login respectivement pour arriver sur la page Login
    Cliquer sur le lien Forgotten Password
    Saisir l'adresse courriel précédente et cliquer sur le bouton Continue    ${val1_email}
    Critère de succès: le message d'envoi de la confirmation s'affiche    ${message}
Exercice 6: L'utilisateur est en mesure de rechercher des produits
    [Documentation]    Test case pour verifier que l'utilisateur est en mesure de rechercher des produits
    Chercher le produit sur le champ de recherche    ${val_search}
    Critère de succès: la page du produit recherché s'affiche    ${val_search}
Exercice 7a: L'utilisateur est informé lorsque le produit recherché n'est pas disponible
    [Documentation]    Test case pour verifier que l'utilisateur est informé lorsque le produit recherché n'est pas disponible
    Chercher le produit sur le champ de recherche    ${val_search}
    La page du produit recherché s'affiche   ${val_search}
    Ajouter le produit au panier    ${val_produit}
    Ouvrir l'onglet Panier et cliquer sur le lien Checkout    ${val_produit}
    Critère de succès: le message d'indisponibilité du produit s'affiche    ${val_messageAbsenceDuProduit}
Exercice 7b: L'utilisateur est informé lorsque le produit avec le nom invalide n'est pas disponible
    [Documentation]    Test case pour verifier que l'utilisateur est informé lorsque le produit avec le nom invalide n'est pas disponible
    Saisir le produit avec le nom invalide sur le champ de recherche    ${val_search_Invalide}
    Cliquer sur le bouton recherche
    Critère de succès: le message d'indisponibilité s'affiche    ${val_messageNoAvailable}
############################################### Exercice 8 ##############################################  
Exercice 8: L'utilisateur peut passer une commande
    [Documentation]    Test case pour verifier que l'utilisateur peut passer une commande
    Cliquer sur les liens My Account et Login respectivement pour arriver sur la page Login
    Saisir les champs dans la page Login Account avec les données valides    ${val1_email}    ${val_password}
    Cliquer sur le bouton Login    
    Chercher le premier produit sur le champ de recherche et l'ajouter au panier    ${val8_search}    ${val8_produit}
    Chercher le deuxième produit sur le champ de recherche et l'ajouter au panier    ${val9_search}    ${val9_produit}
    Procéder avec Checkout    ${val8_produit}
    Remplir la section Step 2 avec les les données valides    ${val1_FirstName}    ${val1_LastName}    ${val_adresse1}    ${val_city}    ${val_postcode}    ${val_country}    ${val_region}
    Remplir la section Step 3 avec les les données valides
    Procéder avec Steps 4, 5 et 6
    Critère de succès: La page avec la confirmation de la commande passée s'ouvre    ${val_messageConfirmation}
    Postcondition: Se déconnecter de la page du compte utilisateur

*** Keywords ***
