coffeedations
=============

validation framework through coffeescript

basic usage
============

```coffeescript
jQuery ($) ->
  $("#some_forms_save_button").live 'click', (event) ->
    errors_div = $("#some_forms_errors_div")
    height = 
      element: $("#mhd_answers_1")
      name: "Height"
      validations: {
        presence: true
        numericality: true
      }
    weight =
      element: $("#mhd_answers_2")
      name: "Weight"
      validations: {
        presence: true
        numericality: true
      }
    return new $.Validations(elements, errors_div).validate()
```
