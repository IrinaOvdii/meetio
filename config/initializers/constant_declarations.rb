START_OFFICE_TIME = '09:00'
END_OFFICE_TIME = '19:00'
MIN_SPOT_DURATION = 3600
ALL_START_TIMES = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00"]
MAX_SPOTS_AMOUNT = 10
LOGGED_USER_EMAIL = 'user@gmail.com'

# In case of future recalculation:

# MAX_SPOTS_AMOUNT = (END_OFFICE_TIME.to_i-START_OFFICE_TIME.to_i)*3600/MIN_SPOT_DURATION

# ALL_START_TIMES = (START_OFFICE_TIME.to_time.to_i .. END_OFFICE_TIME.to_time.to_i).step(MIN_SPOT_DURATION).each{|time| all_start_times << Time.at(time).strftime("%H:%M")}
