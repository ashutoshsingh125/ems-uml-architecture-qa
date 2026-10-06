# H8 EMS — System Architecture, Complete UML Specification & Integration QA Suite
### Module Author: **Ashutosh (Ashu)** (Systems Design Architect & Integration QA Lead)

---

## 1. Project & Module Overview
This repository contains the **System Architecture, UML 2.5 Specification Models, API Middleware Contracts, and Automated Integration Quality Assurance (QA) Suite** of the H8 Emergency Medical Services (EMS) Platform, designed and implemented by **Ashutosh (Ashu)**.

Large distributed microservice platforms involving mobile apps, central dispatch consoles, spatial databases, and external hospitals cannot succeed without a unified architectural blueprint. This module formalizes the entire system lifecycle using **6 standardized UML diagrams**, establishes the shared schema contracts between microservices, and validates cross-service communication via automated end-to-end integration test suites.

```
                  [ 6-Diagram UML Architecture Suite ]
            UseCase ── Class ── Sequence ── Activity ── State ── Deployment
                                   │
                                   ▼
             [ Shared Middleware Contracts & Data Transfer Objects ]
                  contracts/ (JSON Schemas) & common/ (Java DTOs)
                                   │
                                   ▼
            [ Automated End-to-End Integration Test Suite ]
             e2e_integration_test.py (Cross-Service Mediation & Latencies)
                                   │
         ┌─────────────────────────┼─────────────────────────┐
         ▼                         ▼                         ▼
  [ Manish Dispatch ]      [ Pushkar Security ]      [ Niraj PostGIS ]
```

---

## 2. Key Contributions by Ashutosh (Ashu)

### A. Complete 6-Diagram UML Architecture Suite (`diagrams/`)
1. **Use Case Diagram (`01_use_case_diagram.md`)**: Defines interactions across all 5 human actors (911 Caller, Tactical Dispatcher, Paramedic Crew, Hospital ED Staff, and Tactical Administrator).
2. **Domain Class Diagram (`02_class_diagram.md`)**: Full object-oriented domain model linking `AmbulanceUnit`, `Incident`, `DispatchRecord`, `Hospital`, `TelemetryPacket`, and `CandidateRanker`.
3. **Sequence Diagrams (`03_sequence_diagrams.md`)**: Step-by-step temporal messaging sequence for:
   - Call Intake $\rightarrow$ Candidate Ranking $\rightarrow$ Unit Assignment.
   - En Route $\rightarrow$ Satellite Telemetry Streaming $\rightarrow$ Hospital Handover.
4. **Activity Diagram (`04_activity_diagram.md`)**: Control-flow chart of the autonomous multi-factor ranking algorithm and green-wave signal priority trigger.
5. **State Machine Diagram (`05_state_machine_diagram.md`)**: Rigorous formal state transitions of an Ambulance Unit (`AVAILABLE` $\rightarrow$ `DISPATCHED` $\rightarrow$ `EN_ROUTE` $\rightarrow$ `AT_SCENE` $\rightarrow$ `TRANSPORTING` $\rightarrow$ `CLINICAL_HANDOVER`).
6. **Component & Deployment Diagram (`06_component_deployment_diagram.md`)**: Physical deployment architecture mapping browser client apps, edge CDN, Spring Cloud Gateway, Java 17 microservices, and Supabase PostGIS cloud.

### B. Shared API Contracts & Data Transfer Objects (`src/contracts/`, `src/common/`)
- Maintained the single source of truth for all network payloads, preventing breaking changes between Manish's backend, Rahul's PWA, and Niraj's database.

### C. Automated End-to-End Integration Test Suite (`src/test-suites/e2e_integration_test.py`)
- Python test suite verifying cross-module logic:
  - Pushkar's salted telephone anonymization
  - Manish's candidate ranking calculations
  - Rahul's GPS telemetry schema validation
  - Niraj's dynamic hospital diversion logic
  - Sub-50ms latency benchmarking

### D. 25-Case Quality Assurance Matrix (`src/test-suites/test_matrix_report.md`)
- Comprehensive traceability matrix verifying functional, non-functional, security, and performance test conditions.

---

## 3. Technology Stack
- **Architecture & Modeling**: UML 2.5 Standards, Mermaid.js Visual Diagrams, Markdown
- **Data Contracts**: JSON Schema, Protocol Buffers, Java Shared DTOs
- **QA Automation**: Python 3, PyTest / Unittest, Sub-millisecond Performance Timers
- **Java Common**: Java 17, Spring Boot, Jackson JSON Serialization

---

## 4. Directory Structure
```
05_Ashutosh_UML_Architecture_QA/
├── README.md                          <-- You are here
├── run_module.bat                     <-- 1-Click runner for Ashutosh's module
├── diagrams/                          <-- Complete 6-Diagram UML Architecture Suite
│   ├── 01_use_case_diagram.md
│   ├── 02_class_diagram.md
│   ├── 03_sequence_diagrams.md
│   ├── 04_activity_diagram.md
│   ├── 05_state_machine_diagram.md
│   └── 06_component_deployment_diagram.md
└── src/
    ├── contracts/                     <-- API Contract definitions & Schemas
    ├── common/                        <-- Shared Java Data Transfer Objects (DTOs)
    └── test-suites/
        ├── e2e_integration_test.py    <-- Automated integration test runner
        └── test_matrix_report.md      <-- 25-case QA verification matrix
```

---

## 5. How to Run & Test Ashutosh's Module

### 1-Click Test Runner
1. Double-click `run_module.bat` or run:
   ```cmd
   python src\test-suites\e2e_integration_test.py
   ```
2. Observe all 5 automated test contracts execute and validate in real time with sub-50ms latency metrics.
3. Review the visual Mermaid UML diagrams in the `diagrams/` directory using any Markdown viewer, GitHub preview, or VS Code Markdown extension.

---

## 6. Viva & Teacher Q&A Preparation (Questions Ashutosh Can Answer)

**Q1: What was your specific role in this group project?**
> *Answer*: "I was the Systems Design Architect and Integration QA Engineer. I modeled the entire platform using 6 standardized UML diagrams, designed the cross-service API data contracts in `contracts/`, and built the automated integration test suite that verifies communication between Manish's, Pushkar's, Rahul's, and Niraj's modules."

**Q2: What is the difference between your Sequence Diagram and Activity Diagram?**
> *Answer*: "Our Sequence Diagram shows the chronological time-ordered message passing between specific distributed actors and microservices (e.g., from the Dispatcher UI to Pushkar's Hasher to Manish's Router). In contrast, the Activity Diagram focuses on the procedural control flow and decision logic inside the ranking engine (e.g., condition branches evaluating ALS vs BLS clinical suitability and hospital capacity)."

**Q3: Why did you model the Ambulance Unit with a State Machine?**
> *Answer*: "Emergency ambulances have strict legal operational states. An ambulance cannot jump from 'Available' directly to 'Hospital Handover' without going through 'Dispatched', 'En Route', and 'At Scene'. The state machine diagram formalizes these valid lifecycle transitions and prevents illegal state corruptions."

**Q4: How did your test suite verify the system's performance?**
> *Answer*: "In emergency response, sub-second latency saves lives. My automated test suite (`e2e_integration_test.py`) simulates the complete pipeline—from phone hashing to candidate ranking and dispatch alert transmission—and verifies that the total processing latency remains well under our 50-millisecond threshold."

---

## 7. How to Push This Module to Your Own GitHub
```bash
git init
git add .
git commit -m "Initial commit: Ashutosh - UML Architecture Specification & QA Test Suite"
git branch -M main
git remote add origin https://github.com/<your-username>/ems-uml-architecture-qa.git
git push -u origin main
```
