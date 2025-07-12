# 🧞 Genie

**Your Magical Lifestyle Assistant — Modular. Personal. Smart.**

Genie is a modular SwiftUI-based app that brings together multiple smart assistants — each tailored to help you with different parts of life. Whether it’s choosing the perfect outfit, staying on top of your tasks, improving your well-being, or checking in with your emotions, Genie is here to help — magically.

---

## ✨ Modules (Genies)

| Module          | Description                                      |
|-----------------|--------------------------------------------------|
| 🧥 **OutfitGenie**   | AI-powered outfit suggestions, AR try-on       |
| 📅 **PlannerGenie**  | Smart task management, routines, reminders     |
| 🧘 **WellnessGenie** | Fitness tracking, breathing, habits, movement |
| 💬 **Mr. Genie**     | Chat-based mental wellness & mood tracking     |

Each module is fully self-contained, scalable, and built using **SwiftUI + MVVM + Clean Architecture** with **Swift Concurrency**.

## 📐 Architecture Overview

Presentation (SwiftUI Views) -> ViewModels (State & Logic) -> UseCases (Business Logic) -> Repositories (Abstractions) -> Services/Data (ARKit, CoreML, APIs, Storage)

Each module is built as a self-contained folder or Swift Package to ensure scalability and clean separation of concerns.

## 🔮 Vision

> Genie is more than an app — it’s a magical companion that adapts to your lifestyle.  
> Choose your Genie. Ask for help. Get things done.

---

## 📦 Getting Started

> 🚧 Coming soon...

- Clone the repo
- Run with latest Xcode
- SwiftUI Preview-supported modules
- Modular targets coming next

---

## 🧪 In Development

- [x] Module scaffolds
- [ ] Core data models
- [ ] ARKit & CoreML integration for OutfitGenie
- [ ] Task engine & scheduler for PlannerGenie
- [ ] Mood tracker + chat engine for Mr. Genie
