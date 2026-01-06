# SQLi-Defense-Comparison-APEX
Comparative analysis of SQLi defensive coding in Oracle APEX focusing on Security, Performance, Complexity, and Maintainability
# Comparative Analysis of SQLi Defenses (Oracle APEX)

## 1. Project Overview
This project investigates the trade-offs between SQL Concatenation and Bind Variables. It evaluates each method across four metrics: Security, Performance, Complexity, and Maintainability.

## 2. Key Quantitative Results
Data obtained from a 30-cycle execution test in Oracle APEX:

| Metric | Scenario A (Concatenation) | Scenario B (Bind Variables) |
| :--- | :--- | :--- |
| **Avg Latency** | 0.00042s | 0.00058s |
| **Security Success** | 0% (Bypassed) | 100% (Neutralized) |
| **Stability** | Fails (ORA-01756) | High Stability |

## 3. Findings
While Scenario A is slightly faster (0.00016s difference), it is fundamentally insecure. 
Scenario B is the optimal choice for modern DBMS due to its high maintainability and 100% security success rate.
