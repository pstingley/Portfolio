REM pinger.bat
REM Patrick Stingley
REM (240) 475-8400
REM
@echo off
setlocal enabledelayedexpansion

FOR /L %%G IN (150,1,155) DO (
    SET IP=192.168.1.%%G
    ping -n 1 !IP! > temp.txt
    find "Received = 1" temp.txt > nul
    IF !ERRORLEVEL! EQU 0 (
        echo !IP! responded
    ) ELSE (
        find "Received = 0" temp.txt > nul
        IF !ERRORLEVEL! EQU 0 (
            echo !IP! did not respond
        ) ELSE (
            find "Destination host unreachable" temp.txt > nul
            IF !ERRORLEVEL! EQU 0 (
                echo Destination host unreachable
            ) ELSE (
                echo Failed to ping !IP!
            )
        )
    )
    del temp.txt
)

endlocal
