import "bootstrap";
import "bootstrap-datepicker";
import "bootstrap-datepicker/dist/css/bootstrap-datepicker.css";

// $('.datepicker').datepicker();

let inputData = $('.input-daterange input').each(function() {
    $(this).datepicker({format: 'dd/mm/yyyy'});
});

let submit = document.querySelector(".submit");

submit.addEventListener("click", function(){
  console.log(inputData[0].value, inputData[1].value);
});
