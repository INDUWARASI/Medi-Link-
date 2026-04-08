/**
 * Medi-Link – Caregiver Reminder System
 * All data is persisted in localStorage so it survives page refreshes.
 */

'use strict';

const STORAGE_KEY_PATIENTS  = 'medilink_patients';
const STORAGE_KEY_REMINDERS = 'medilink_reminders';

/* ============================================================
   DATA LAYER
   ============================================================ */

function loadPatients() {
  try {
    return JSON.parse(localStorage.getItem(STORAGE_KEY_PATIENTS)) || [];
  } catch {
    return [];
  }
}

function savePatients(patients) {
  localStorage.setItem(STORAGE_KEY_PATIENTS, JSON.stringify(patients));
}

function loadReminders() {
  try {
    return JSON.parse(localStorage.getItem(STORAGE_KEY_REMINDERS)) || [];
  } catch {
    return [];
  }
}

function saveReminders(reminders) {
  localStorage.setItem(STORAGE_KEY_REMINDERS, JSON.stringify(reminders));
}

function generateId() {
  return Date.now().toString(36) + Math.random().toString(36).slice(2, 7);
}

/* ============================================================
   SEED DATA  (first run only)
   ============================================================ */

function seedDemoData() {
  if (loadPatients().length > 0) return; // already seeded

  const patients = [
    { id: 'p1', name: 'Alice Johnson',  age: 72, condition: 'Hypertension' },
    { id: 'p2', name: 'Robert Chen',    age: 65, condition: 'Type 2 Diabetes' },
    { id: 'p3', name: 'Margaret Singh', age: 80, condition: 'Osteoporosis' },
  ];
  savePatients(patients);

  const now   = new Date();
  const fmt   = (d) => d.toISOString().slice(0, 10);
  const fmtT  = (d) => d.toTimeString().slice(0, 5);

  function hoursLater(h) {
    const d = new Date(now);
    d.setHours(d.getHours() + h);
    return d;
  }
  function daysLater(n) {
    const d = new Date(now);
    d.setDate(d.getDate() + n);
    return d;
  }

  const t1  = hoursLater(1);
  const t2  = hoursLater(3);
  const t3  = daysLater(1);
  const t4  = daysLater(2);
  const t5  = daysLater(-1);   // past

  const reminders = [
    {
      id: generateId(), patientId: 'p1',
      title: 'Take Amlodipine 5 mg',
      type: 'medication',
      date: fmt(t1), time: fmtT(t1),
      notes: 'Take after breakfast with a full glass of water.',
    },
    {
      id: generateId(), patientId: 'p1',
      title: 'Blood pressure check',
      type: 'appointment',
      date: fmt(t3), time: '09:30',
      notes: 'Dr. Perera at City Medical Centre – Room 4.',
    },
    {
      id: generateId(), patientId: 'p2',
      title: 'Take Metformin 500 mg',
      type: 'medication',
      date: fmt(t2), time: fmtT(t2),
      notes: 'Take with meal.',
    },
    {
      id: generateId(), patientId: 'p2',
      title: '30-minute walk',
      type: 'exercise',
      date: fmt(t4), time: '07:00',
      notes: 'Low-impact walk around the neighbourhood.',
    },
    {
      id: generateId(), patientId: 'p3',
      title: 'Take Calcium + Vitamin D',
      type: 'medication',
      date: fmt(t5), time: '08:00',
      notes: 'Morning supplement.',
    },
    {
      id: generateId(), patientId: 'p3',
      title: 'Bone density follow-up',
      type: 'appointment',
      date: fmt(t3), time: '14:00',
      notes: 'Radiology department, second floor.',
    },
  ];
  saveReminders(reminders);
}

/* ============================================================
   UTILITIES
   ============================================================ */

const TYPE_META = {
  medication:  { icon: '💊', label: 'Medication',   badgeClass: 'badge-medication'  },
  appointment: { icon: '🏥', label: 'Appointment',  badgeClass: 'badge-appointment' },
  exercise:    { icon: '🏃', label: 'Exercise',     badgeClass: 'badge-exercise'    },
  other:       { icon: '📌', label: 'Other',        badgeClass: 'badge-other'       },
};

function formatDateTime(date, time) {
  const dt = new Date(`${date}T${time}`);
  return dt.toLocaleString(undefined, {
    weekday: 'short', month: 'short', day: 'numeric',
    hour: '2-digit', minute: '2-digit',
  });
}

function isPast(date, time) {
  return new Date(`${date}T${time}`) < new Date();
}

function isWithinMinutes(date, time, minutes) {
  const dt = new Date(`${date}T${time}`);
  const diff = dt - new Date();
  return diff >= 0 && diff <= minutes * 60 * 1000;
}

function escapeHtml(str) {
  if (!str) return '';
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

/* ============================================================
   TOAST NOTIFICATIONS
   ============================================================ */

function showToast(message, type = '', duration = 4000) {
  const container = document.getElementById('toast-container');
  const toast = document.createElement('div');
  toast.className = `toast ${type ? 'toast-' + type : ''}`;
  toast.textContent = message;
  container.appendChild(toast);
  setTimeout(() => {
    toast.style.opacity = '0';
    toast.style.transition = 'opacity .3s';
    setTimeout(() => toast.remove(), 350);
  }, duration);
}

/* ============================================================
   RENDER HELPERS
   ============================================================ */

function buildReminderCard(reminder, patients, showPatientName, showActions) {
  const patient = patients.find(p => p.id === reminder.patientId);
  const meta    = TYPE_META[reminder.type] || TYPE_META.other;
  const past    = isPast(reminder.date, reminder.time);
  const overdue = past && !reminder.acknowledged;

  return `
    <div class="reminder-card type-${escapeHtml(reminder.type)} ${past ? 'past' : ''}"
         data-id="${escapeHtml(reminder.id)}">
      ${overdue ? '<span class="reminder-overdue-badge">Overdue</span>' : ''}
      <span class="reminder-type-badge ${meta.badgeClass}">
        ${meta.icon} ${meta.label}
      </span>
      <div class="reminder-title">${escapeHtml(reminder.title)}</div>
      ${showPatientName && patient
        ? `<div class="reminder-patient-name">👤 ${escapeHtml(patient.name)}</div>`
        : ''}
      <div class="reminder-datetime">📅 ${escapeHtml(formatDateTime(reminder.date, reminder.time))}</div>
      ${reminder.notes
        ? `<div class="reminder-notes">📝 ${escapeHtml(reminder.notes)}</div>`
        : ''}
      ${showActions ? `
        <div class="reminder-actions">
          <button class="btn btn-ghost btn-sm" onclick="App.openEditReminderModal('${escapeHtml(reminder.id)}')">✏️ Edit</button>
          <button class="btn btn-ghost btn-sm" style="color:var(--danger)" onclick="App.askDeleteReminder('${escapeHtml(reminder.id)}')">🗑️ Delete</button>
        </div>` : ''}
    </div>`;
}

function buildPatientCard(patient) {
  return `
    <div class="patient-card" data-id="${escapeHtml(patient.id)}">
      <div class="patient-card-name">👤 ${escapeHtml(patient.name)}</div>
      ${patient.age       ? `<div class="patient-card-meta">Age: ${escapeHtml(String(patient.age))}</div>` : ''}
      ${patient.condition ? `<div class="patient-card-meta">Condition: ${escapeHtml(patient.condition)}</div>` : ''}
      <div class="patient-card-actions">
        <button class="btn btn-outline btn-sm"
                onclick="App.openAddReminderModal('${escapeHtml(patient.id)}')">+ Reminder</button>
        <button class="btn btn-ghost btn-sm" style="color:var(--danger)"
                onclick="App.deletePatient('${escapeHtml(patient.id)}')">Remove</button>
      </div>
    </div>`;
}

function renderEmptyState(icon, message) {
  return `<div class="empty-state"><span class="empty-icon">${icon}</span>${escapeHtml(message)}</div>`;
}

/* ============================================================
   APP
   ============================================================ */

const App = (() => {

  let currentRole     = null;
  let currentPatientId = null;
  let pendingDeleteId  = null;
  let notifiedIds      = new Set();

  /* ---------- navigation ---------- */

  function showScreen(id) {
    document.querySelectorAll('.screen').forEach(s => s.classList.remove('active'));
    document.getElementById(id).classList.add('active');
  }

  function selectRole(role) {
    currentRole = role;
    if (role === 'caregiver') {
      renderCaregiverDashboard();
      showScreen('screen-caregiver');
    } else {
      const patients = loadPatients();
      if (patients.length === 0) {
        showToast('No patients found. Ask your caregiver to add you.', 'warning');
        return;
      }
      currentPatientId = patients[0].id;
      renderPatientDashboard();
      showScreen('screen-patient');
    }
  }

  function logout() {
    currentRole      = null;
    currentPatientId = null;
    showScreen('screen-landing');
  }

  /* ---------- caregiver render ---------- */

  function renderCaregiverDashboard() {
    const patients  = loadPatients();
    const reminders = loadReminders();

    // populate filter dropdown
    const fp = document.getElementById('filter-patient');
    const currentFP = fp.value;
    fp.innerHTML = '<option value="">All patients</option>';
    patients.forEach(p => {
      const opt = document.createElement('option');
      opt.value = p.id;
      opt.textContent = p.name;
      if (p.id === currentFP) opt.selected = true;
      fp.appendChild(opt);
    });

    applyFilters();
    renderPatientsList();
  }

  function applyFilters() {
    const patients  = loadPatients();
    const reminders = loadReminders();

    const fPatient = document.getElementById('filter-patient').value;
    const fType    = document.getElementById('filter-type').value;
    const fStatus  = document.getElementById('filter-status').value;

    const filtered = reminders.filter(r => {
      if (fPatient && r.patientId !== fPatient) return false;
      if (fType    && r.type      !== fType)    return false;
      if (fStatus === 'upcoming' && isPast(r.date, r.time)) return false;
      if (fStatus === 'past'     && !isPast(r.date, r.time)) return false;
      return true;
    });

    // sort: upcoming first, then by datetime
    filtered.sort((a, b) => {
      const da = new Date(`${a.date}T${a.time}`);
      const db = new Date(`${b.date}T${b.time}`);
      const pa = isPast(a.date, a.time);
      const pb = isPast(b.date, b.time);
      if (pa !== pb) return pa ? 1 : -1;
      return da - db;
    });

    const container = document.getElementById('caregiver-reminders-list');
    if (filtered.length === 0) {
      container.innerHTML = renderEmptyState('📭', 'No reminders match your filters.');
    } else {
      container.innerHTML = filtered
        .map(r => buildReminderCard(r, patients, true, true))
        .join('');
    }
  }

  function renderPatientsList() {
    const patients = loadPatients();
    const container = document.getElementById('patients-list');
    if (patients.length === 0) {
      container.innerHTML = renderEmptyState('👥', 'No patients yet. Add one below.');
    } else {
      container.innerHTML = patients.map(buildPatientCard).join('');
    }
  }

  /* ---------- patient render ---------- */

  function renderPatientDashboard() {
    const patients  = loadPatients();
    const reminders = loadReminders();

    // patient selector
    const sel = document.getElementById('patient-selector');
    sel.innerHTML = '';
    patients.forEach(p => {
      const opt = document.createElement('option');
      opt.value = p.id;
      opt.textContent = p.name;
      if (p.id === currentPatientId) opt.selected = true;
      sel.appendChild(opt);
    });

    const myReminders = reminders.filter(r => r.patientId === currentPatientId);
    const upcoming    = myReminders.filter(r => !isPast(r.date, r.time))
                                   .sort((a, b) => new Date(`${a.date}T${a.time}`) - new Date(`${b.date}T${b.time}`));
    const past        = myReminders.filter(r => isPast(r.date, r.time))
                                   .sort((a, b) => new Date(`${b.date}T${b.time}`) - new Date(`${a.date}T${a.time}`));

    // summary
    document.getElementById('patient-summary').innerHTML = `
      <div class="summary-card">
        <div class="s-number">${upcoming.length}</div>
        <div class="s-label">Upcoming</div>
      </div>
      <div class="summary-card">
        <div class="s-number">${upcoming.filter(r => r.type === 'medication').length}</div>
        <div class="s-label">Medications</div>
      </div>
      <div class="summary-card">
        <div class="s-number">${upcoming.filter(r => r.type === 'appointment').length}</div>
        <div class="s-label">Appointments</div>
      </div>
      <div class="summary-card">
        <div class="s-number">${past.length}</div>
        <div class="s-label">Past</div>
      </div>`;

    // upcoming
    const upcomingEl = document.getElementById('patient-reminders-upcoming');
    upcomingEl.innerHTML = upcoming.length === 0
      ? renderEmptyState('✅', 'No upcoming reminders.')
      : upcoming.map(r => buildReminderCard(r, patients, false, false)).join('');

    // past
    const pastEl = document.getElementById('patient-reminders-past');
    pastEl.innerHTML = past.length === 0
      ? renderEmptyState('📂', 'No past reminders.')
      : past.map(r => buildReminderCard(r, patients, false, false)).join('');
  }

  function switchPatient() {
    currentPatientId = document.getElementById('patient-selector').value;
    renderPatientDashboard();
  }

  /* ---------- modals ---------- */

  function openModal(id) {
    document.getElementById(id).classList.add('open');
  }

  function closeModal(id) {
    document.getElementById(id).classList.remove('open');
  }

  // Close modal on overlay click
  document.querySelectorAll('.modal-overlay').forEach(overlay => {
    overlay.addEventListener('click', e => {
      if (e.target === overlay) overlay.classList.remove('open');
    });
  });

  // Close modal on Escape key
  document.addEventListener('keydown', e => {
    if (e.key === 'Escape') {
      document.querySelectorAll('.modal-overlay.open').forEach(m => m.classList.remove('open'));
    }
  });

  /* ---------- add/edit reminder ---------- */

  function openAddReminderModal(preselectedPatientId) {
    document.getElementById('modal-reminder-title').textContent = 'Add Reminder';
    document.getElementById('form-reminder').reset();
    document.getElementById('r-id').value = '';

    // set default date/time to now + 1 hour
    const d = new Date();
    d.setHours(d.getHours() + 1);
    document.getElementById('r-date').value = d.toISOString().slice(0, 10);
    document.getElementById('r-time').value = d.toTimeString().slice(0, 5);

    // populate patient dropdown
    populatePatientDropdown('r-patient', preselectedPatientId || '');
    openModal('modal-reminder');
  }

  function openEditReminderModal(id) {
    const reminder = loadReminders().find(r => r.id === id);
    if (!reminder) return;

    document.getElementById('modal-reminder-title').textContent = 'Edit Reminder';
    document.getElementById('r-id').value    = reminder.id;
    document.getElementById('r-title').value = reminder.title;
    document.getElementById('r-type').value  = reminder.type;
    document.getElementById('r-date').value  = reminder.date;
    document.getElementById('r-time').value  = reminder.time;
    document.getElementById('r-notes').value = reminder.notes || '';

    populatePatientDropdown('r-patient', reminder.patientId);
    openModal('modal-reminder');
  }

  function populatePatientDropdown(selectId, selectedId) {
    const sel = document.getElementById(selectId);
    sel.innerHTML = '<option value="">Select patient…</option>';
    loadPatients().forEach(p => {
      const opt = document.createElement('option');
      opt.value = p.id;
      opt.textContent = p.name;
      if (p.id === selectedId) opt.selected = true;
      sel.appendChild(opt);
    });
  }

  function saveReminder(event) {
    event.preventDefault();

    const id        = document.getElementById('r-id').value;
    const patientId = document.getElementById('r-patient').value;
    const title     = document.getElementById('r-title').value.trim();
    const type      = document.getElementById('r-type').value;
    const date      = document.getElementById('r-date').value;
    const time      = document.getElementById('r-time').value;
    const notes     = document.getElementById('r-notes').value.trim();

    if (!patientId || !title || !type || !date || !time) {
      showToast('Please fill in all required fields.', 'error');
      return;
    }

    const reminders = loadReminders();

    if (id) {
      // edit
      const idx = reminders.findIndex(r => r.id === id);
      if (idx !== -1) {
        reminders[idx] = { ...reminders[idx], patientId, title, type, date, time, notes };
        showToast('Reminder updated.', 'success');
      }
    } else {
      // add
      reminders.push({ id: generateId(), patientId, title, type, date, time, notes });
      showToast('Reminder added successfully.', 'success');
    }

    saveReminders(reminders);
    closeModal('modal-reminder');
    renderCaregiverDashboard();
  }

  /* ---------- delete reminder ---------- */

  function askDeleteReminder(id) {
    pendingDeleteId = id;
    const reminder = loadReminders().find(r => r.id === id);
    document.getElementById('modal-confirm-text').textContent =
      `Are you sure you want to delete "${reminder ? reminder.title : 'this reminder'}"?`;
    openModal('modal-confirm');
  }

  function confirmDelete() {
    if (!pendingDeleteId) return;
    const reminders = loadReminders().filter(r => r.id !== pendingDeleteId);
    saveReminders(reminders);
    pendingDeleteId = null;
    closeModal('modal-confirm');
    showToast('Reminder deleted.', 'success');
    renderCaregiverDashboard();
  }

  /* ---------- patients ---------- */

  function openAddPatientModal() {
    document.getElementById('form-patient').reset();
    openModal('modal-patient');
  }

  function savePatient(event) {
    event.preventDefault();
    const name      = document.getElementById('p-name').value.trim();
    const age       = document.getElementById('p-age').value.trim();
    const condition = document.getElementById('p-condition').value.trim();

    if (!name) {
      showToast('Patient name is required.', 'error');
      return;
    }

    const patients = loadPatients();
    patients.push({ id: generateId(), name, age: age ? parseInt(age, 10) : '', condition });
    savePatients(patients);
    closeModal('modal-patient');
    showToast(`Patient "${name}" added.`, 'success');
    renderCaregiverDashboard();
  }

  function deletePatient(patientId) {
    const patients = loadPatients().filter(p => p.id !== patientId);
    savePatients(patients);

    // Remove associated reminders
    const reminders = loadReminders().filter(r => r.patientId !== patientId);
    saveReminders(reminders);

    showToast('Patient removed.', 'success');
    renderCaregiverDashboard();
  }

  /* ---------- reminder notifications ---------- */

  function checkReminders() {
    const reminders = loadReminders();
    const NOTIFY_WINDOW_MIN = 15; // notify 15 min before due

    reminders.forEach(r => {
      if (notifiedIds.has(r.id)) return;
      if (isWithinMinutes(r.date, r.time, NOTIFY_WINDOW_MIN)) {
        const patients = loadPatients();
        const patient  = patients.find(p => p.id === r.patientId);
        const meta     = TYPE_META[r.type] || TYPE_META.other;
        const msg      = `⏰ Reminder for ${patient ? patient.name : 'patient'}: ${meta.icon} ${r.title}`;
        showToast(msg, 'reminder', 8000);
        notifiedIds.add(r.id);

        // Browser notification (if permission granted)
        if (Notification && Notification.permission === 'granted') {
          new Notification('Medi-Link Reminder', {
            body: `${meta.icon} ${r.title}`,
            icon: 'data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><text y=".9em" font-size="90">💊</text></svg>',
          });
        }
      }
    });
  }

  function requestNotificationPermission() {
    if (Notification && Notification.permission === 'default') {
      Notification.requestPermission();
    }
  }

  /* ---------- init ---------- */

  function init() {
    seedDemoData();
    showScreen('screen-landing');
    requestNotificationPermission();

    // Check reminders every 60 seconds
    setInterval(checkReminders, 60_000);
    // Also check once 3 s after load
    setTimeout(checkReminders, 3000);
  }

  document.addEventListener('DOMContentLoaded', init);

  /* ---------- public API ---------- */
  return {
    selectRole,
    logout,
    applyFilters,
    openAddReminderModal,
    openEditReminderModal,
    saveReminder,
    askDeleteReminder,
    confirmDelete,
    openAddPatientModal,
    savePatient,
    deletePatient,
    switchPatient,
    openModal,
    closeModal,
  };

})();
