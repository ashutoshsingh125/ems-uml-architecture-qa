@echo off
title H8 EMS - Ashutosh Module (UML Architecture & Integration QA)
echo ==========================================================
echo  H8 EMS - MODULE 05: UML ARCHITECTURE SPECIFICATION & QA
echo  Author: Ashutosh (Systems Design Architect & QA Lead)
echo ==========================================================
echo.
echo Running automated integration test suite...
echo.
python src\test-suites\e2e_integration_test.py
echo.
echo ==========================================================
echo Test run complete. Opening UML architecture diagrams...
echo ==========================================================
start notepad diagrams\01_use_case_diagram.md
pause
