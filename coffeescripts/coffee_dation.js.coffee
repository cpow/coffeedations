class $.Validations

  constructor: (@validation_objects, @errors_div) ->

  validate: ->
    errors=0
    this.clear_errors(@errors_div)
    error_objects = this.check_errors()
    for object in error_objects
      if object.errors.length==0
        this.unwrap_element(object.element)
      else
        errors+=1
        this.build_errors(object.errors, @errors_div, object.element)
    return false unless errors==0

  check_errors: ->
    for validation_object in @validation_objects
      errors = []
      validation_object.errors = []
      element_value = validation_object.element.val()
      if validation_object.validations.matches then errors.push("#{validation_object.name} doesn't match #{validation_object.validations.matches.name}") unless validation_object.element.val()==validation_object.validations.matches.element.val()
      if validation_object.validations.numericality then errors.push("#{validation_object.name} must be a number") unless element_value.match(/^[0-9]+/)
      if validation_object.validations.presence then errors.push("#{validation_object.name} cannot be blank") unless element_value!=""
      if validation_object.validations.length then errors.push("#{validation_object.name} must be #{validation_object.validations.length} characters") unless element_value.length==validation_object.validations.length
      validation_object.errors = errors
    return @validation_objects

  build_errors: (errors, errors_div, element) ->
    errors_div.html("<div class='error'>") unless errors_div.children().hasClass("error")
    for error in errors
      $(".error").append("#{error}").append("<br />")
      this.wrap_element(element)

  clear_errors: (errors_div) ->
    errors_div.html("")

  wrap_element: (element) ->
    element.wrap("<div class='field_with_errors' />") unless element.parent().hasClass("field_with_errors")

  unwrap_element: (element) ->
    element.unwrap() if element.parent().hasClass("field_with_errors")

