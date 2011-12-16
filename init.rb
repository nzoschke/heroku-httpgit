module Heroku
  module Helpers
    def create_git_remote(app, remote)
      return unless has_git?
      return if git('remote').split("\n").include?(remote)
      return unless File.exists?(".git")
      git "remote add #{remote} http://code-production.herokuapp.com/#{app}.git"
      display "Git remote #{remote} added"
    end
  end
end
  