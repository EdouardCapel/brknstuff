import "bootstrap";

import "bootstrap-datepicker";
import "bootstrap-datepicker/dist/css/bootstrap-datepicker.css";

// $('.datepicker').datepicker();

let inputData = $('.input-daterange input').each(function() {
    $(this).datepicker({format: 'dd/mm/yyyy'});
});
