@echo off
cls
goto :menu

:menu
echo Informe a opcao:
echo 1 - Iniciar rede Wifi ja configurada
echo 2 - Setar Rede Wifi
echo 3 - Parar rede Wifi
echo 4 - Listar configuracoes
echo 5 - Limpar configuracoes
set /p op=Digite sua opcao: 
if %op%==1 (goto :iniciar) 
if %op%==2 (goto :setar) 
if %op%==3 (goto :parar) 
if %op%==4 (goto :listar) 
if %op%==5 (goto :limpar)
goto end

:iniciar
echo Iniciando...
netsh wlan start hostednetwork
echo Iniciado com sucesso
pause
cls
goto :menu
goto end

:setar
set /p ssid=Digite o SSID da rede: 
set /p senha=Digite a senha da rede: 
echo Aguarde...
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%senha%
netsh wlan start hostednetwork
echo Iniciado com sucesso
pause
cls
goto :menu
goto end

:parar
echo Parando...
netsh wlan stop hostednetwork
echo Parado com sucesso
pause
cls
goto :menu
goto end

:listar
netsh wlan show hostednetwork
pause
cls
goto :menu
goto end

:limpar
echo Limpando configuracoes...
echo Parando o servico Wlan...
net stop wlansvc
echo Deletando Reg Key...
reg delete hklm\system\currentcontrolset\services\wlansvc\parameters\hostednetworksettings /v hostednetworksettings
echo Reiniciando o servico Wlan...
net start wlansvc
echo Desabilitando a 'hostednetwork'...
netsh wlan set hostednetwork mode=disallow
echo Limpo com sucesso
pause
cls
goto :menu
goto end
