// FLATPICKR
import flatpickr from 'flatpickr'
import 'flatpickr/dist/flatpickr.min.css'

flatpickr(".datepicker", {
  altInput: true,
});

flatpickr(".datetimepicker", {
  altInput: true,
  enableTime: true,
  time_24hr: true
});
