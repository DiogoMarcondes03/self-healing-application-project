# Self-Healing Snake Game on Azure

A portfolio project demonstrating cloud engineering skills through a static web application with monitoring infrastructure and planned self-healing capabilities on Microsoft Azure.

## Project Overview

This project combines a classic Snake game with enterprise-grade cloud infrastructure, showcasing real-world cloud engineering problem-solving and architectural decision-making. The project evolved through multiple deployment strategies to overcome Azure subscription limitations.

## Technologies Used

- **Cloud Platform:** Microsoft Azure
- **Infrastructure as Code:** Terraform
- **Frontend:** HTML5 Canvas, CSS3, JavaScript
- **Monitoring:** Azure Monitor, Application Insights, Log Analytics
- **Security:** Azure Key Vault
- **Hosting:** Azure Storage Static Website

## Current Architecture

The solution includes:

- **Azure Storage Account** - Static website hosting for the Snake game
- **Application Insights** - Real-time application monitoring and telemetry
- **Log Analytics Workspace** - Centralized logging and analysis
- **Azure Monitor** - Health checks and alerting (planned)
- **Key Vault** - Secure secret management
- **Logic Apps** - Automated incident response (future implementation)

## Project Evolution

This project demonstrates real-world cloud engineering problem-solving:

1. **Initial Approach:** Azure App Service with Node.js backend
   - Encountered Azure quota limitations for App Service Plans
   
2. **Pivot to Containers:** Azure Container Instances 
   - Hit Docker registry connectivity issues and Key Vault permission problems
   
3. **Final Solution:** Azure Storage Static Website
   - Reliable, cost-effective, and demonstrates architectural flexibility

This evolution showcases key cloud engineering skills: troubleshooting, architectural pivoting, and finding practical solutions under constraints.

## Features

### Current Implementation
- Responsive Snake game with HTML5 Canvas
- Application Insights integration for monitoring
- Infrastructure as Code with modular Terraform
- Professional documentation and version control

### Planned Features (Phase 2)
- Automated monitoring alerts for website availability
- Teams/Email notifications for incidents
- Custom monitoring dashboards
- Automated remediation workflows

## Project Structure

```
self-healing-project/
├── main.tf                 # Terraform provider and variables
├── resource-group.tf       # Resource group configuration
├── storage.tf              # Storage account with static website
├── monitoring.tf           # Application Insights and Log Analytics
├── key-vault.tf           # Secure secret storage
├── outputs.tf             # Terraform outputs
└── snake-game/            # Application files
    ├── index.html         # Game interface
    ├── style.css          # Game styling
    └── script.js          # Game logic
```

## 🚀 Deployment

### Prerequisites
- Azure subscription with appropriate permissions 🔑
- Terraform installed 🏗️
- Azure CLI configured ⚙️

### Deploy Infrastructure
```bash
terraform init
terraform plan  
terraform apply
```

Your Snake game will be available at the static website URL provided in the Terraform outputs! 🎉

## 💰 Cost Optimization

Designed for minimal cost while demonstrating enterprise concepts:
- Storage Account: ~$1-2/month
- Application Insights: Free tier (1GB/month)
- Log Analytics: Free tier (5GB/month)
- **Total: ~$2-3/month**

## Skills Demonstrated

- **Problem Solving:** Navigating Azure quotas and service limitations
- **Infrastructure as Code:** Modular Terraform architecture
- **Monitoring & Observability:** Application monitoring setup
- **Cost Management:** Optimizing for budget constraints
- **Documentation:** Professional project documentation
- **Architectural Flexibility:** Adapting solutions to real-world constraints

## Business Value

This project demonstrates:
- **Operational Resilience:** Planning for monitoring and automated response
- **Cost Efficiency:** Maximizing functionality within budget
- **Practical Engineering:** Making architectural trade-offs based on real constraints
- **Professional Development:** Learning from challenges and pivoting when needed

## Author

**Diogo Marcondes da Silva**  
Email: sigcurtis03@gmail.com  
LinkedIn: [linkedin.com/in/diogo-marcondes-da-silva](https://www.linkedin.com/in/diogo-marcondes-da-silva)  
Azure Certified: AZ-104 (Azure Administrator Associate)

---

*This project demonstrates cloud engineering capabilities through both technical implementation and real-world problem-solving.*