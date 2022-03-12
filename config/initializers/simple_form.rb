# frozen_string_literal: true
#
# Uncomment this and change the path if necessary to include your own
# components.
# See https://github.com/heartcombo/simple_form#custom-components to know
# more about custom components.
# Dir[Rails.root.join('lib/components/**/*.rb')].each { |f| require f }
#
# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :default, class: "form_group" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: "visually-hidden"
    b.use :input, class: 'form_input', error_class: 'form_input-invalid'
  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :default
  config.boolean_style = :nested
  config.button_class = 'btn'
  # Default tag used for error notification helper.
  config.error_notification_tag = :div
  # CSS class to add for error notification helper.
  config.error_notification_class = 'error_notification'
  # How the label text should be generated altogether with the required text.
  config.label_text = lambda { |label, _, _| label }
  # You can define which elements should obtain additional classes
  config.generate_additional_classes_for = []
  config.browser_validations = false
  # Define the default class of the input wrapper of the boolean input.
  config.boolean_label_class = 'form_checkbox-label'
end
