::Ainda contém bugs

@echo off
cls
goto :menu

set /p op=Digite sua opcao: 

if %op%==1 (goto :iniciar) 
if %op%==2 (goto :setar) 
if %op%==3 (goto :parar) 
if %op%==4 (goto :listar) 
if %op%==5 (goto :limpar)

:menu
echo Informe a opcao:
echo 1 - Iniciar rede Wifi ja configurada
echo 2 - Setar Rede Wifi
echo 3 - Parar rede Wifi
echo 4 - Listar configuracoes
echo 5 - Limpar configuracoes
goto end

:iniciar
echo Iniciando...
netsh wlan start hostednetwork
echo Iniciado com sucesso
pause
goto :menu
goto end

:setar
set /p ssid=Digite o SSID da rede: 
set /p senha=Digite a senha da rede: 
echo Aguarde...
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%senha%
netsh wlan start hostednetwork
echo Iniciado com sucesso

:parar
echo Parando...
netsh wlan stop hostednetwork
echo Parado com sucesso

:listar
netsh wlan show hostednetwork

:limpar
echo Limpando configuracoes...
net stop wlansvc
reg delete hklm\system\currentcontrolset\services\wlansvc\parameters\hostednetworksettings /v hostednetworksettings
net start wlansvc
echo Limpo com sucesso


pause
