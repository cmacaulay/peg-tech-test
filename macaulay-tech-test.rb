require 'json'
# Iterate through data and:
## Return the ~ title ~ of the most likes v. dislikes
## Average % of likes vs. dislikes for 12 videos
## ~ Bonus ~ the average time interval between videos

file        = File.read('zoella_videos.json')
videos_hash = JSON.parse(file)
videos      = videos_hash['videos']

def calculation_loop(videos)
  total_views     = 0
  rating_average  = 0
  most_liked      = ""
  highest_average = 0
  videos.each do |video|
    video_average = video['likes'] / video['dislikes']
    if highest_average < video_average
      highest_average = video_average
      most_liked = video['title']
    end
    total_views = total_views + video['views']
  end
  p "Total Views: #{total_views}"
  p "#{most_liked}, highest % of likes vs. dislikes, at #{highest_average}%"
end


calculation_loop(videos)




# Done:
# Read the JSON file, store data
## Total number of views
