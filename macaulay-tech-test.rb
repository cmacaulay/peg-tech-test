require 'json'
# Iterate through data and:
## ~ Bonus ~ the average time interval between videos

file        = File.read('zoella_videos.json')
videos_hash = JSON.parse(file)
videos      = videos_hash['videos']

def calculation_loop(videos)
  total_views     = 0
  most_liked      = ""
  averages        = []

  videos.each do |video|
    highest_average = 0
    video_average = video['likes'] / video['dislikes']

    if highest_average < video_average
      highest_average = video_average
      most_liked = video['title']
    end

    averages << video_average
    total_views = total_views + video['views']
  end
  like_average = calculate_average(averages)
  p "Total Views: #{total_views}"
  p "Best Like Ratio: #{most_liked}"
  p "Average of likes v. dislikes for all videos: #{like_average}%"
end

def calculate_average(data)
  data.reduce(:+) / 12
end

calculation_loop(videos)


# Done:
# Read the JSON file, store data
## Total number of views
## Return the ~ title ~ of the most likes v. dislikes
## Average % of likes vs. dislikes for 12 videos
