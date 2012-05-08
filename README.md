coffeedations
=============

validation framework through coffeescript

basic usage
============

Just place the coffee_dations file in your javascript sources, create a new event listener in coffeescript, add some fields to look for and some validations. DONE

```coffeescript
jQuery ($) ->
  $("#some_forms_save_button").live 'click', (event) ->
    errors_div = $("#some_forms_errors_div")
    field_1 = 
      element: $("#field_1")
      name: "Height"
      validations: {
        presence: true
        numericality: true
      }
    field_2 =
      element: $("#field_2")
      name: "Weight"
      validations: {
        presence: true
        numericality: true
      }
    elements = [field_1, field_2]
    return new $.Validations(elements, errors_div).validate()
```
