# 🚀 Salesforce Service Cloud POC — Case Management & SLA Escalation

## 📌 Overview

This project demonstrates a Service Cloud implementation focused on automating case management using SLA tracking, Apex-based escalation, and performance monitoring.

The solution is designed to ensure timely handling of support cases by automatically identifying SLA breaches and triggering escalation actions.

---

## 🧩 Key Features

- **SLA Monitoring**  
  Tracks case deadlines using a custom `SLA_Deadline__c` field and identifies overdue cases.

- **Automated Case Escalation**  
  Uses Scheduled Apex (`CaseEscalationScheduler`) and service logic to:
  - Detect SLA breaches  
  - Update escalation status  
  - Create high-priority follow-up tasks  

- **Agent Productivity Tracking**  
  Captures:
  - First response time  
  - Resolution time  
  - Escalation status 
---

## ⚙️ How It Works

Case Created
↓
SLA Deadline Assigned
↓
Scheduled Apex Runs Periodically
↓
CaseEscalationService Evaluates Cases
↓
Escalation Triggered (if SLA breached)
↓
Task Created for Agent
↓
Reports & Dashboard Updated
