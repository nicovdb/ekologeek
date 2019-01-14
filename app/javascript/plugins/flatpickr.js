import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import { French } from "flatpickr/dist/l10n/fr.js"

flatpickr(".datepicker", {
  altInput: true,
  "locale": French,
  altFormat: "l d F Y",
  maxDate: new Date()
});
