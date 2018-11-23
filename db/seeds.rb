# Admin user for editing and deleting instances
User.create!(Rails.application.credentials.soundstorm_admin)

# A test instance for ping acceptance
Instance.create!(
  host: 'soundstorm.test',
  version: '1.0.0'
)
