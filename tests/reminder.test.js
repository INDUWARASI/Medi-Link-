/**
 * Tests for Medi-Link reminder system logic (Node.js – no DOM required)
 * Run with:  node tests/reminder.test.js
 */

'use strict';

let passed = 0;
let failed = 0;

function assert(condition, message) {
  if (condition) {
    console.log(`  ✅ PASS: ${message}`);
    passed++;
  } else {
    console.error(`  ❌ FAIL: ${message}`);
    failed++;
  }
}

/* -------------------------------------------------------
   Copy the pure-logic helpers from app.js for unit testing
   (without any browser APIs)
   ------------------------------------------------------- */

function generateId() {
  return Date.now().toString(36) + Math.random().toString(36).slice(2, 7);
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

function formatDateTime(date, time) {
  const dt = new Date(`${date}T${time}`);
  return dt.toLocaleString(undefined, {
    weekday: 'short', month: 'short', day: 'numeric',
    hour: '2-digit', minute: '2-digit',
  });
}

/* ---- In-memory store ---- */
function makeStore() {
  let patients  = [];
  let reminders = [];
  return {
    getPatients:    () => [...patients],
    savePatients:   (p) => { patients = p; },
    getReminders:   () => [...reminders],
    saveReminders:  (r) => { reminders = r; },
    addPatient(p)   { patients.push(p); },
    addReminder(r)  { reminders.push(r); },
  };
}

/* ---- CRUD helpers (mirrors app.js logic) ---- */
function addReminder(store, reminder) {
  const reminders = store.getReminders();
  reminders.push({ id: generateId(), ...reminder });
  store.saveReminders(reminders);
}

function editReminder(store, id, updates) {
  const reminders = store.getReminders();
  const idx = reminders.findIndex(r => r.id === id);
  if (idx === -1) return false;
  reminders[idx] = { ...reminders[idx], ...updates };
  store.saveReminders(reminders);
  return true;
}

function deleteReminder(store, id) {
  store.saveReminders(store.getReminders().filter(r => r.id !== id));
}

function deletePatient(store, patientId) {
  store.savePatients(store.getPatients().filter(p => p.id !== patientId));
  store.saveReminders(store.getReminders().filter(r => r.patientId !== patientId));
}

function getRemindersForPatient(store, patientId) {
  return store.getReminders().filter(r => r.patientId === patientId);
}

function getUpcoming(store, patientId) {
  return getRemindersForPatient(store, patientId).filter(r => !isPast(r.date, r.time));
}

function getPast(store, patientId) {
  return getRemindersForPatient(store, patientId).filter(r => isPast(r.date, r.time));
}

/* -------------------------------------------------------
   TESTS
   ------------------------------------------------------- */

console.log('\n===== Medi-Link Reminder Tests =====\n');

/* --- generateId --- */
console.log('generateId()');
{
  const a = generateId();
  const b = generateId();
  assert(typeof a === 'string' && a.length > 0, 'returns a non-empty string');
  assert(a !== b, 'generates unique IDs');
}

/* --- isPast --- */
console.log('\nisPast()');
{
  const past   = new Date(Date.now() - 60_000);
  const future = new Date(Date.now() + 60_000);
  const toDate = d => d.toISOString().slice(0, 10);
  const toTime = d => d.toTimeString().slice(0, 5);

  assert(isPast(toDate(past), toTime(past)),     'returns true for a past datetime');
  assert(!isPast(toDate(future), toTime(future)), 'returns false for a future datetime');
}

/* --- isWithinMinutes --- */
console.log('\nisWithinMinutes()');
{
  const soon = new Date(Date.now() + 5 * 60_000);   // 5 min from now
  const far  = new Date(Date.now() + 60 * 60_000);  // 60 min from now
  const toDate = d => d.toISOString().slice(0, 10);
  const toTime = d => d.toTimeString().slice(0, 5);

  assert(isWithinMinutes(toDate(soon), toTime(soon), 15),   '5-min reminder is within 15-min window');
  assert(!isWithinMinutes(toDate(far), toTime(far), 15),    '60-min reminder is NOT within 15-min window');
}

/* --- escapeHtml --- */
console.log('\nescapeHtml()');
{
  assert(escapeHtml('<script>') === '&lt;script&gt;',     'escapes < and >');
  assert(escapeHtml('"hello"')  === '&quot;hello&quot;',  'escapes double quotes');
  assert(escapeHtml("it's")     === 'it&#039;s',          'escapes single quotes');
  assert(escapeHtml('a&b')      === 'a&amp;b',            'escapes ampersand');
  assert(escapeHtml('')         === '',                   'returns empty string for empty input');
  assert(escapeHtml(null)       === '',                   'returns empty string for null');
}

/* --- formatDateTime --- */
console.log('\nformatDateTime()');
{
  const result = formatDateTime('2030-06-15', '08:30');
  assert(typeof result === 'string' && result.length > 0, 'returns a non-empty string');
}

/* --- CRUD: add reminder --- */
console.log('\nCRUD – addReminder()');
{
  const store = makeStore();
  addReminder(store, { patientId: 'p1', title: 'Take aspirin', type: 'medication', date: '2030-01-01', time: '08:00', notes: '' });
  const all = store.getReminders();
  assert(all.length === 1, 'adds a reminder to the store');
  assert(all[0].title === 'Take aspirin', 'stores the correct title');
  assert(all[0].type  === 'medication',   'stores the correct type');
  assert(typeof all[0].id === 'string',   'assigns an id');
}

/* --- CRUD: edit reminder --- */
console.log('\nCRUD – editReminder()');
{
  const store = makeStore();
  addReminder(store, { patientId: 'p1', title: 'Walk 20 min', type: 'exercise', date: '2030-02-01', time: '07:00', notes: '' });
  const id = store.getReminders()[0].id;
  const ok = editReminder(store, id, { title: 'Walk 30 min' });
  assert(ok === true,                              'returns true on successful edit');
  assert(store.getReminders()[0].title === 'Walk 30 min', 'updates the title');
  assert(store.getReminders()[0].type  === 'exercise',    'preserves unchanged fields');
  assert(!editReminder(store, 'nonexistent', {}),  'returns false for unknown id');
}

/* --- CRUD: delete reminder --- */
console.log('\nCRUD – deleteReminder()');
{
  const store = makeStore();
  addReminder(store, { patientId: 'p1', title: 'Blood test', type: 'appointment', date: '2030-03-01', time: '09:00', notes: '' });
  addReminder(store, { patientId: 'p1', title: 'Take meds',  type: 'medication',  date: '2030-03-01', time: '08:00', notes: '' });
  const id = store.getReminders()[0].id;
  deleteReminder(store, id);
  assert(store.getReminders().length === 1,          'removes one reminder');
  assert(store.getReminders()[0].title === 'Take meds', 'removes the correct reminder');
}

/* --- CRUD: delete patient removes their reminders --- */
console.log('\nCRUD – deletePatient() cascades to reminders');
{
  const store = makeStore();
  store.addPatient({ id: 'p1', name: 'Alice' });
  store.addPatient({ id: 'p2', name: 'Bob' });
  addReminder(store, { patientId: 'p1', title: 'Meds A', type: 'medication', date: '2030-04-01', time: '08:00', notes: '' });
  addReminder(store, { patientId: 'p2', title: 'Meds B', type: 'medication', date: '2030-04-01', time: '09:00', notes: '' });
  deletePatient(store, 'p1');
  assert(store.getPatients().length  === 1, 'removes the patient');
  assert(store.getReminders().length === 1, "removes only that patient's reminders");
  assert(store.getReminders()[0].patientId === 'p2', "keeps other patients' reminders");
}

/* --- filter: upcoming vs past --- */
console.log('\nFilter – getUpcoming / getPast');
{
  const store = makeStore();
  const futureDate = new Date(Date.now() + 24 * 60 * 60_000);
  const pastDate   = new Date(Date.now() - 24 * 60 * 60_000);
  const toDate = d => d.toISOString().slice(0, 10);
  const toTime = d => d.toTimeString().slice(0, 5);

  addReminder(store, { patientId: 'p1', title: 'Future reminder', type: 'medication',
    date: toDate(futureDate), time: toTime(futureDate), notes: '' });
  addReminder(store, { patientId: 'p1', title: 'Past reminder',   type: 'medication',
    date: toDate(pastDate),   time: toTime(pastDate),   notes: '' });

  assert(getUpcoming(store, 'p1').length === 1, 'getUpcoming returns only future reminders');
  assert(getPast(store, 'p1').length     === 1, 'getPast returns only past reminders');
  assert(getUpcoming(store, 'p1')[0].title === 'Future reminder', 'correct upcoming reminder');
  assert(getPast(store, 'p1')[0].title     === 'Past reminder',   'correct past reminder');
}

/* --- filter by patient --- */
console.log('\nFilter – getRemindersForPatient');
{
  const store = makeStore();
  addReminder(store, { patientId: 'p1', title: 'R1', type: 'medication', date: '2030-05-01', time: '08:00', notes: '' });
  addReminder(store, { patientId: 'p1', title: 'R2', type: 'exercise',   date: '2030-05-02', time: '09:00', notes: '' });
  addReminder(store, { patientId: 'p2', title: 'R3', type: 'medication', date: '2030-05-03', time: '10:00', notes: '' });
  assert(getRemindersForPatient(store, 'p1').length === 2, 'returns only reminders for patient p1');
  assert(getRemindersForPatient(store, 'p2').length === 1, 'returns only reminders for patient p2');
}

/* --- multiple reminders per patient --- */
console.log('\nMultiple reminders per patient');
{
  const store = makeStore();
  ['Meds', 'Appointment', 'Exercise', 'Other'].forEach(function(title, i) {
    var day = String(i + 1).padStart(2, '0');
    addReminder(store, { patientId: 'p1', title: title, type: 'medication', date: '2030-06-' + day, time: '08:00', notes: '' });
  });
  assert(getRemindersForPatient(store, 'p1').length === 4, 'supports multiple reminders per patient');
}

/* -------------------------------------------------------
   Summary
   ------------------------------------------------------- */
console.log(`\n===== Results: ${passed} passed, ${failed} failed =====\n`);
if (failed > 0) process.exit(1);
