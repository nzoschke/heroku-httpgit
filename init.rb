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

  module Command
    class Base
      def git_remotes(base_dir=Dir.pwd)
        remotes = {}
        original_dir = Dir.pwd
        Dir.chdir(base_dir)

        git("remote -v").split("\n").each do |remote|
          name, url, method = remote.split(/\s/)
          if url =~ /^git@#{heroku.host}:([\w\d-]+)\.git$/
            remotes[name] = $1
          elsif url =~ /^http:\/\/code-production.herokuapp.com\/([\w\d-]+)\.git$/
            remotes[name] = $1
          end
        end

        Dir.chdir(original_dir)
        remotes
      end
    end
  end
end
  