
@echo off
setlocal EnableExtensions
title Sammi CMD Study Assistant
color 0A
cd /d "%~dp0"

if not exist "study_data" mkdir "study_data"

:menu
cls
echo ======================================
echo       SAMMI STUDY ASSISTANT
echo ======================================
echo.
echo   [1] Start 25 Minute Study Timer
echo   [2] Add a Study Task
echo   [3] View Study Tasks
echo   [4] Write a Quick Note
echo   [5] View Saved Notes
echo   [6] Daily Study Goal
echo   [7] Exit
echo.
set "choice="
set /p "choice=Choose an option: "

if "%choice%"=="1" goto timer
if "%choice%"=="2" goto addtask
if "%choice%"=="3" goto viewtasks
if "%choice%"=="4" goto note
if "%choice%"=="5" goto viewnotes
if "%choice%"=="6" goto goal
if "%choice%"=="7" goto end
echo Invalid choice. Try again.
pause
goto menu

:timer
cls
echo Starting a 25-minute study session...
echo Keep this window open.
timeout /t 1500
echo.
echo Study session finished! Great work!
echo Take a 5-minute break.
timeout /t 300
pause
goto menu

:addtask
cls
set "task="
set /p "task=Enter your study task: "
if not defined task goto menu
>>"study_data\tasks.txt" echo([%date%] %task%
echo Task saved!
pause
goto menu

:viewtasks
cls
echo ========== YOUR STUDY TASKS ==========
if exist "study_data\tasks.txt" (
    type "study_data\tasks.txt"
) else (
    echo No tasks saved yet.
)
echo.
pause
goto menu

:note
cls
set "note="
set /p "note=Write your note (one line): "
if not defined note goto menu
>>"study_data\notes.txt" echo([%date%] %note%
echo Note saved!
pause
goto menu

:viewnotes
cls
echo ========== YOUR SAVED NOTES ==========
if exist "study_data\notes.txt" (
    type "study_data\notes.txt"
) else (
    echo No notes saved yet.
)
echo.
pause
goto menu

:goal
cls
set "goal="
set /p "goal=Enter today's study goal: "
if not defined goal goto menu
>"study_data\goal.txt" echo(%goal%
echo.
echo Your daily goal:
type "study_data\goal.txt"
pause
goto menu

:end
echo Keep learning every day. Goodbye!
endlocal
exit /b
