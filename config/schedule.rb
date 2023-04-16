# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
# 開発環境用
# rails_env = Rails.env.to_sym # cronを実行する環境変数
# set :environment, rails_env # 実行環境の指定

# 本番環境用
set :environment, :production# 実行環境の指定

# cronのログ
set :output, 'log/cron.log'
#1時間に一度メゾッドが実行される
every 1.minute do
  begin
    runner "Batch::DataReset.data_reset"
    #runner "Batch::DataReset.logout"
  rescue => e
    Rails.logger.error("aborted rails runner")
    raise e
  end
end

# $ sudo systemctl stop crond
# $ sudo systemctl start crond
