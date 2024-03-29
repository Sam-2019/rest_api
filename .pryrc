# frozen_string_literal: true

Pry.config.windows_console_warning = false

begin
  require "hirb"
rescue LoadError
  puts "no hirb :("
end

begin
  require "awesome_print"
  Pry.config.print = proc { |output, value|
    Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)
  }
rescue LoadError => err
  puts "no awesome_print :("
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end
