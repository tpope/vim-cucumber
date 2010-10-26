Spec::Matchers.define :be_same_text do |expected|
  match do |actual|
    expected == actual
  end

  failure_message_for_should do |actual|
    require 'tempfile'
    diff = nil
    Tempfile.open('actual') do |actual_f|
      Tempfile.open('expected') do |expected_f|
        actual_f.print actual
        expected_f.print expected
        actual_f.close
        expected_f.close
        diff = %x(diff -u '#{expected_f.path}' '#{actual_f.path}')
      end
    end
    diff.split($/)[2..-1].join($/)
  end
end
