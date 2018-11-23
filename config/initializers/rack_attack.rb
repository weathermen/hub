class Rack::Attack
  LOCAL_IPS = %w(127.0.0.1 ::1)

  # Always allow requests through local channels
  safelist('ignore/localhost') do |request|
    request.ip.in? LOCAL_IPS
  end

  # Always allow requests for admins
  safelist('ignore/admins') do |request|
    request.session.key(:user_id)
  end

  # Prevent DDoS attacks from rogue Soundstorm servers
  throttle('throttle/pings', limit: 300, period: 5.minutes) do |request|
    request.ip if request.path == '/instances'
  end
end
