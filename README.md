# Medi-Link 💊

A web-based healthcare application that lets **caregivers set reminders for their patients** — including medication schedules, appointments, and exercise plans.

## Features

### Caregiver Dashboard
- Add, edit and delete patients
- Create reminders for any patient with:
  - **Type**: Medication 💊, Appointment 🏥, Exercise 🏃, Other 📌
  - Title, date, time, and optional notes
- Filter reminders by patient, type, or status (upcoming / past)
- Overdue reminders are clearly highlighted

### Patient Dashboard
- Switch between patient profiles
- See a summary of upcoming medications, appointments, and past reminders
- Upcoming and past reminders shown separately in chronological order

### Notifications
- In-app toast notifications when a reminder is within 15 minutes
- Optional browser push notifications (if permission is granted)
- Reminder data is persisted in `localStorage` so it survives page refreshes

## Getting Started

No build step required — this is a plain HTML/CSS/JavaScript application.

1. Open `index.html` in any modern browser.
2. Choose **Caregiver** to manage patients and reminders, or **Patient** to view reminders.
3. Demo data (3 patients with upcoming and past reminders) is seeded on first load.

## Running Tests

```bash
node tests/reminder.test.js
```

All core logic (ID generation, date helpers, CRUD operations, filters, HTML escaping) is covered by unit tests that run in Node.js with no dependencies.

## Project Structure

```
Medi-Link-/
├── index.html          # Application entry point
├── css/
│   └── styles.css      # All styles
├── js/
│   └── app.js          # Application logic (data layer + UI)
├── tests/
│   └── reminder.test.js  # Unit tests (Node.js)
└── package.json
```