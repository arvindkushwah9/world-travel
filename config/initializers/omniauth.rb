Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "#{ENV['FACEBOOK_APP_ID']}", "#{ENV['FACEBOOK_APP_SERCRET']}", :scope => 'email, user_friends, manage_pages, pages_show_list'
  # provider :google_oauth2, "#{ENV['GOOGLE_APP_ID']}", "#{ENV['GOOGLE_APP_SERCRET']}", scope: 'userinfo.profile,youtube,email', provider_ignores_state: true, prompt: :consent
  # provider :twitter, "#{ENV['Twitter_APP_ID']}", "#{ENV['Twitter_APP_SERCRET']}"
  # provider :linkedin, "#{ENV['Linkedin_APP_ID']}", "#{ENV['Linkedin_APP_SERCRET']}"
  # provider :github, "#{ENV['Github_APP_ID']}", "#{ENV['Github_APP_SERCRET']}", :scope => 'email'
  # provider :pinterest, "#{ENV['Pinterest_APP_ID']}", "#{ENV['Pinterest_APP_SERCRET']}", :scope => 'read_public,write_public'
end