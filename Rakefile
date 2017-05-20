task default: %w[test]

require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "lib" << "tests"
  p t.test_files = FileList["tests/*_test.rb"].exclude(/^test\/test_spec/)
  t.verbose = true
end

task :count do
  files = `git ls-files -z`.split("\x0")
  shell_cmd = "wc -l "
  files.grep(%r{^(exe|lib|test|heelspec)/}).each do |f|
    shell_cmd << f << " \\\n"
  end
  begin
    sh shell_cmd[0..-3]
  rescue
    puts "Count Error."
  end
end
