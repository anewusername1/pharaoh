Factory.define :user do |u|
  u.email "yourmom@blah.com"
  u.password "password"
  # u.password_confirm "password"
end

Factory.define :admin_user, :class => User do |au|
  au.email "iam@dmin.com"
  au.password "password"
  au.role "admin"
end