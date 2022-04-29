namespace :ci do
  begin
    require "rubocop/rake_task"
    RuboCop::RakeTask.new
  rescue LoadError # rubocop:disable Lint/SuppressedException
  end

  begin
    require "bundler/audit/task"
    Bundler::Audit::Task.new
  rescue LoadError # rubocop:disable Lint/SuppressedException
  end

  task(:quality).clear
  task quality: %i[rubocop]
  task(:test).clear
  task test: ["bundle:audit", :quality, :spec_with_coverage]

  task :spec_with_coverage do
    ENV["RUN_COVERAGE"] = "true"
    Rake::Task["spec"].invoke
  end
end
