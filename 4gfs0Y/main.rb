def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

template 'console_helper.rb.tt', 'lib/console_helper.rb'

inject_into_class 'config/application.rb', 'Application' do
  <<-EOS.strip_heredoc.indent(4)
    console do
      require 'console_helper'
      Rails::ConsoleMethods.include(ConsoleHelper)
    end
  EOS
end

git add: "."
git commit: %Q<-m 'ConsoleHelper'>