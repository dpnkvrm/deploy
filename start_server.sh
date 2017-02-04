cd /var/www/reshotel;
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -L https://get.rvm.io | bash -s stable;
source /home/deploy/.rvm/scripts/rvm;
rvm autolibs disable;
rvm requirements;
rvm install ruby-2.0.0;
rvm use ruby-2.0.0;
gem install bundler;
gem install god;
bundle install;
rake db:create;
rake db:migrate;
rake db:seed;
god restart;
