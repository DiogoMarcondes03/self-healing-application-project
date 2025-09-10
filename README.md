# Self-Healing Snake Game on Azure

A portfolio project demonstrating cloud engineering skills through a containerized web application with automated monitoring and self-healing capabilities on Microsoft Azure.

## 🎯 Project Overview

This project showcases the implementation of a resilient web application that can automatically detect issues and recover without manual intervention. It combines a classic Snake game with enterprise-grade cloud infrastructure, monitoring, and automated incident response.

## 🛠️ Technologies Used

- **Cloud Platform:** Microsoft Azure
- **Infrastructure as Code:** Terraform
- **Application:** Node.js + Express
- **Frontend:** HTML5 Canvas, CSS3, JavaScript
- **Monitoring:** Azure Monitor, Application Insights, Log Analytics
- **Automation:** Azure Logic Apps (planned)
- **Security:** Azure Key Vault

## 🏗️ Architecture

The solution includes:

- **Azure App Service (F1 Free Tier)** - Hosts the Snake game application
- **Application Insights** - Real-time application monitoring and telemetry
- **Log Analytics Workspace** - Centralized logging and analysis
- **Azure Monitor** - Health checks and alerting
- **Storage Account** - Diagnostic logs and backup storage  
- **Key Vault** - Secure secret management
- **Logic Apps** - Automated incident response (future implementation)

## 🔧 Features

### Current Implementation
- ✅ Responsive Snake game with HTML5 Canvas
- ✅ Health check endpoint (`/health`) for monitoring
- ✅ Application Insights integration
- ✅ Infrastructure as Code with Terraform
- ✅ Proper error handling and graceful shutdown

### Planned Features (Phase 2)
- 🔄 Automated service restart on health check failures
- 📧 Teams/Email notifications for incidents
- 📊 Custom monitoring dashboards
- 🚀 Auto-scaling based on load
- 🔄 Failover to backup regions

## 📁 Project Structure

```
self-healing-project/
├── main.tf                 # Terraform provider and variables
├── resource-group.tf       # Resource group configuration
├── app-service.tf          # App Service and hosting setup
├── monitoring.tf           # Application Insights and Log Analytics
├── storage.tf              # Storage account for logs
├── key-vault.tf           # Secure secret storage
├── outputs.tf             # Terraform outputs
└── snake-game/            # Application files
    ├── package.json       # Node.js dependencies
    ├── server.js          # Express server with health endpoint
    ├── index.html         # Game interface
    ├── style.css          # Game styling
    └── script.js          # Game logic
```

## 🚀 Deployment Instructions

### Prerequisites
- Azure subscription with appropriate permissions
- Terraform installed
- Node.js 18+ installed
- Azure CLI configured

### 1. Deploy Infrastructure

```bash
# Clone the repository
git clone <repository-url>
cd self-healing-project

# Initialize Terraform
terraform init

# Plan deployment
terraform plan

# Deploy resources
terraform apply
```

### 2. Deploy Application

```bash
cd snake-game

# Install dependencies
npm install

# Test locally (optional)
npm start

# Deploy to Azure App Service
# (Use Azure CLI or Git deployment)
```

## 🎮 How to Play

1. Navigate to your deployed App Service URL
2. Click "Start Game"
3. Use arrow keys to control the snake
4. Collect red food to grow and increase score
5. Avoid hitting walls or the snake's own body

## 📊 Monitoring Endpoints

- **Game:** `https://your-app-name.azurewebsites.net/`
- **Health Check:** `https://your-app-name.azurewebsites.net/health`
- **API Stats:** `https://your-app-name.azurewebsites.net/api/stats`

## 💰 Cost Optimization

This project is designed for minimal cost:
- App Service F1 (Free Tier): $0/month
- Application Insights: Free tier (1GB/month)
- Log Analytics: Free tier (5GB/month)
- Storage Account: ~$1-2/month
- **Total: ~$2-3/month**

## 🔐 Security Features

- Azure Key Vault for secret management
- Managed Service Identity for secure access
- HTTPS enforcement
- Environment variable protection

## 📈 Skills Demonstrated

- **Cloud Architecture:** Designing resilient, scalable solutions
- **Infrastructure as Code:** Terraform for reproducible deployments
- **Monitoring & Observability:** Comprehensive application monitoring
- **DevOps Practices:** Automated deployment and configuration
- **Cost Management:** Optimizing cloud resources for budget efficiency
- **Security:** Implementing cloud security best practices

## 🎯 Business Value

This project demonstrates understanding of:
- **Incident Management:** Proactive monitoring and automated response
- **System Reliability:** Building fault-tolerant applications
- **Operational Excellence:** Reducing manual intervention and human error
- **Cost Efficiency:** Maximizing functionality within budget constraints

## 📝 Future Enhancements

- Implement complete self-healing automation
- Add multi-region deployment for high availability
- Create custom monitoring dashboards
- Implement CI/CD pipelines with GitHub Actions
- Add user authentication and score persistence
- Performance optimization and caching strategies

## 👨‍💻 Author

**Diogo Marcondes da Silva**
- Email: sigcurtis03@gmail.com
- LinkedIn: [linkedin.com/in/diogo-marcondes-da-silva](https://www.linkedin.com/in/diogo-marcondes-da-silva)
- Azure Certified: AZ-104 (Azure Administrator Associate)

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

*This project was created as a portfolio demonstration of cloud engineering capabilities and modern DevOps practices.*