    class DatePickerInput < SimpleForm::Inputs::StringInput
      def input_html_options
        value = object.send(attribute_name)
        options = {
          value: value.nil?? nil : I18n.localize(value,:format => "%d-%m-%Y"),
          data: { behaviour: 'datepicker' }  # for example
        }
        # add all html option you need...
        super.merge options
      end


      def input_html_classes
        super.push('datepicker')
      end
    end
