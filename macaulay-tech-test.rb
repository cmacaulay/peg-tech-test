require 'json'
require 'time'
# Iterate through data and:
## Average % of likes vs. dislikes for 12 videos
## ~ Bonus ~ the average time interval between videos

file        = File.read('zoella_videos.json')
videos_hash = JSON.parse(file)
videos      = videos_hash['videos']

def calculation_loop(videos)
  total_views      = 0
  most_liked       = ""
  averages         = []
  publishing_times = []
  videos.each do |video|
    highest_average = 0
    video_average   = video['likes'] / video['dislikes']
    time_published  = Time.parse(video['published_at'])


    if highest_average < video_average
      highest_average = video_average
      most_liked = video['title']
    end

    averages << video_average
    publishing_times << time_published

    total_views = total_views + video['views']
  end
  like_average          = calculate_average(averages)
  time_intervals        = calculate_time_interval(publishing_times)
  average_time_interval = calculate_average(time_intervals)

  print_results(total_views, most_liked, like_average, average_time_interval)
end

def calculate_average(data)
  data.reduce(:+) / 12
end

def calculate_time_interval(times)
  previous = 0
  times.map do |time|
    previous = time if previous == 0
    interval = (time - previous).abs.to_i
    previous = time
    interval
  end
end

def print_results(total_views, most_liked, like_average, time_interval)
  p "Total Views: #{total_views}"
  p "Best Like Ratio: #{most_liked}"
  p "Average of likes v. dislikes for all videos: #{like_average}%"
  p "Average time interval: #{time_interval} milliseconds"
end

calculation_loop(videos)
# Done:
# Read the JSON file, store data
## Total number of views
## Return the ~ title ~ of the most likes v. dislikes
## Average % of likes vs. dislikes for 12 videos
# Iterate through data and:
## ~ Bonus ~ the average time interval between videos